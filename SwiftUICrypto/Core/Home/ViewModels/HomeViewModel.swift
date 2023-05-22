//
//  HomeViewModel.swift
//  SwiftUICrypto
//
//  Created by Loic HACHEME on 09/05/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var isLoading: Bool = false
    @Published var searchText: String = ""
    
    @Published var statistics: [StatisticModel] = []
    
    
    private var cancellables = Set<AnyCancellable>()
    private let coinDataService = CoinDataService()
    private let portfolioDataService = PortfolioDataService()
    private let marketDataService = MarketDataService()
    
    
    init() {
       addSubscribers()
    }
    
    func addSubscribers() {
       
        //updates allCoins
        $searchText
            .combineLatest(coinDataService .$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map {(search, savedCoins) in
                return self.filterCoins(text: search, coins: savedCoins)
            }
            .sink {[weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        
        //updates portfolioCoins
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map { (coinModels, portfolioEntities) -> [CoinModel] in
                return self.mapAllCoinsToPortfolioCoins(allCoins: coinModels, portfolioEntities: portfolioEntities)
            }
            .sink { [weak self] returnedCoins in
                self?.portfolioCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        
        //update marketData
        marketDataService.$marketData
            .combineLatest($portfolioCoins)
            .map { marketDataModel,portfCoins -> [StatisticModel] in
            return self.mapGlobalMarketData(marketDataModel: marketDataModel,portfolioCoins: portfCoins)
        }.sink { [weak self] returnedStats in
            self?.statistics = returnedStats
            self?.isLoading = false
        }.store(in: &cancellables)
        
        
       
        
            
    }
    
    
    func reloadData() {
        isLoading = true
        coinDataService.getCoins()
        marketDataService.getData()
        HapticManager.notification(type: .success)
    }
    
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
    
    
    private func filterCoins(text:String,coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        let textLowerCase = text.lowercased()
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(textLowerCase) ||
            coin.symbol.lowercased().contains(textLowerCase) ||
            coin.id.lowercased().contains(textLowerCase)
        }
        
    }
    
    
    private func mapAllCoinsToPortfolioCoins(allCoins: [CoinModel], portfolioEntities: [PortfolioEntity]) -> [CoinModel] {
        allCoins.compactMap { coin in
            guard let entity = portfolioEntities.first(where: {$0.coinID == coin.id}) else {
                return nil
            }
            return coin.updateHoldings(amount: entity.amount)
        }
    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?, portfolioCoins: [CoinModel]) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        guard let data = marketDataModel else {return stats}
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
                    
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        
        let portfolioValue = portfolioCoins
            .map({$0.currentHoldingsValue})
            .reduce(0, +)
        
        let previousValue = portfolioCoins
            .map { (coin) -> Double in
                let currentValue = coin.currentHoldingsValue
                let percentChange = (coin.priceChangePercentage24H ?? 0) / 100
                let previousValue = currentValue / (1 + percentChange)
                return previousValue
            }
            .reduce(0, +)
        
        
        let percentageChange = ((portfolioValue - previousValue) / previousValue) * 100
        
        let portfolio = StatisticModel(title: "Portfolio Value",
                                       value: portfolioValue.asCurrencyWith2Decimals(), percentageChange: percentageChange)
        
        stats.append(contentsOf: [
        marketCap,volume,btcDominance,portfolio])
        return stats
    }
}
