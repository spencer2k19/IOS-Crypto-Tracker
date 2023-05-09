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
    
    
    private var cancellables = Set<AnyCancellable>()
    private let dataService = CoinDataService()
    
    
    init() {
       addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoints.sink {[weak self] (returnedCoins) in
            self?.allCoins = returnedCoins
        }
        .store(in: &cancellables)
    }
}
