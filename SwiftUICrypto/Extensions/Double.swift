//
//  Double.swift
//  SwiftUICrypto
//
//  Created by Loic HACHEME on 09/05/2023.
//

import Foundation

extension Double {
    
    
    /// Converts a Double into a  Currency with  2  decimal places
    ///```
    /// Convert 1234.56 to $1,234.56
    ///```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = Locale.current
        //formatter.currencySymbol = "$"
        //formatter.currencyCode = "usd"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        return formatter
    }
    
    
    /// Converts a Double into a  Currency as a String with  2decimal places
    ///```
    /// Convert 1234.56 to "$1,234.56"
    ///```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    
    
    
    
    
    
    /// Converts a Double into a  Currency with  2-6 decimal places
    ///```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    ///```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = Locale.current
        //formatter.currencySymbol = "$"
        //formatter.currencyCode = "usd"
        formatter.maximumFractionDigits = 6
        formatter.minimumFractionDigits = 2
        
        return formatter
    }
    
    
    /// Converts a Double into a  Currency as a String with  2-6 decimal places
    ///```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.3456"
    /// Convert 0.123456 to "$0.123456"
    ///```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// Converts a Double into a  string representation
    ///```
    /// Convert 1.2345 to "1.23"
    ///```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Converts a Double into a  string representation with percent symbol
    ///```
    /// Convert 1.2345 to "1.23%"
    ///```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
