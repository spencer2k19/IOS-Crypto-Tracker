//
//  CoinRowView.swift
//  SwiftUICrypto
//
//  Created by Loic HACHEME on 09/05/2023.
//

import SwiftUI

struct CoinRowView: View {
    let coin:CoinModel
    let showHoldingsColumn:Bool
    
    
    var body: some View {
        HStack(spacing: 0) {
           leftColumn
            Spacer()
            
            if showHoldingsColumn {
               centerColumn
            }
            
           rightColumn
        }.font(.subheadline)
    }
}


extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            
            
            Circle()
                .frame(width: 30,height: 30)
            Text(coin.symbol.uppercased())
                .foregroundColor(Color.theme.accent)
                .font(.headline)
                .padding(.leading,6)
        }
    }
    
    
    private var centerColumn: some View {
        VStack(alignment:.trailing) {
            Text(coin.currentHoldingsValue?.asCurrencyWith2Decimals() ?? "")
                .bold()
            
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(Color.theme.accent)
            
            
            Text(coin.priceChangePercentage24H?.asPercentString() ?? " ")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0
                    ? Color.theme.green
                    : Color.theme.red
                )
            
        }
        .frame(width: UIScreen.main.bounds.width / 3.5,alignment: .trailing)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
            
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
       
    }
}
