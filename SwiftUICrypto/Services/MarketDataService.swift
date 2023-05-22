//
//  MarketDataService.swift
//  SwiftUICrypto
//
//  Created by Loic HACHEME on 17/05/2023.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscription:AnyCancellable?
    
    init() {
        getData()
    }
    
     func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {return}
        
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleData(completion:), receiveValue: {[weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
          
    }
    
}
