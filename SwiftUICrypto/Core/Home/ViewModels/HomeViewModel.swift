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
    
    
    private var cancellables = Set<AnyCancellable>()
    private let dataService = CoinDataService()
    
    
    init() {
       addSubscribers()
    }
    
    func addSubscribers() {
       
        //updates allCoins
        $searchText
            .combineLatest(dataService.$allCoins)
            .map {(search, savedCoins) in
                return self.filterCoins(text: search, coins: savedCoins)
            }
            .sink {[weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
            
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
}
