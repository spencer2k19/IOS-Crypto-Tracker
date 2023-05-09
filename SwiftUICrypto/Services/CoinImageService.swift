//
//  CoinImageService.swift
//  SwiftUICrypto
//
//  Created by Loic HACHEME on 09/05/2023.
//

import Foundation
import SwiftUI
import Combine



class CoinImageService {
    @Published var image:UIImage? = nil
    
    private var imageSubscription:AnyCancellable?
    
    private let coin:CoinModel
    
    init(coin:CoinModel) {
        self.coin = coin
       getCoinImage()
    }
    
    private func getCoinImage() {
        guard let url = URL(string:coin.image) else {return}
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data)-> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleData(completion:), receiveValue: {[weak self] (returnedImage) in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
}
