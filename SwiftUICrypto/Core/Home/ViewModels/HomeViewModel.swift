//
//  HomeViewModel.swift
//  SwiftUICrypto
//
//  Created by Loic HACHEME on 09/05/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins:[CoinModel] = []
    @Published var portfolioCoins:[CoinModel] = []
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
        
        
        //update marketData
        marketDataService.$marketData.map { marketDataModel -> [StatisticModel] in
            return self.mapGlobalMarketData(marketDataModel: marketDataModel)
        }.sink { [weak self] returnedStats in
            self?.statistics = returnedStats
        }.store(in: &cancellables)
        
        
        //updates portfolioCoins
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map { (coinModels, portfolioEntities) -> [CoinModel] in
                coinModels.compactMap { coin in
                    guard let entity = portfolioEntities.first(where: {$0.coinID == coin.id}) else {
                        return nil
                    }
                    return coin.updateHoldings(amount: entity.amount)
                }
            }
            .sink { [weak self] returnedCoins in
                self?.portfolioCoins = returnedCoins
            }
            .store(in: &cancellables)
        
            
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
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        guard let data = marketDataModel else {return stats}
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
                    
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = StatisticModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
        
        stats.append(contentsOf: [
        marketCap,volume,btcDominance,portfolio])
        return stats
    }
}
