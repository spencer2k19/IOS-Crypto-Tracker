//
//  CoinImageViewModel.swift
//  SwiftUICrypto
//
//  Created by Loic HACHEME on 09/05/2023.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel:ObservableObject {
    @Published var image:UIImage? = nil
    @Published var isLoading:Bool = false
    
    private let coin: CoinModel
    private let dataService:CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin:CoinModel) {
        self.coin = coin
        dataService = CoinImageService(coin: coin )
       addSubscribers()
        isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image.sink { [weak self](_) in
            self?.isLoading = false
        } receiveValue: { [weak self] returnedImage in
            self?.image = returnedImage
        }
        .store(in: &cancellables)

    }
    
}
