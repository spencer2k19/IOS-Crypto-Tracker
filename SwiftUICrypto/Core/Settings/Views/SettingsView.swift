//
//  SettingsView.swift
//  SwiftUICrypto
//
//  Created by Loic HACHEME on 02/06/2023.
//

import SwiftUI

struct SettingsView: View {
    let defaultURL = URL(string: "https://www.google.com")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://github.com/spencer2k19")!
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView {
            List {
              thinkingSection
              coinGeckoSection
                developerSection
                applicationSection
            }
            .accentColor(.blue)
            .font(.headline)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                       
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                    })
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


extension SettingsView {
    
    private var thinkingSection: some View {
        Section(header: Text("Thinking")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This app was made by using MVVM architecture, Combine and CoreData!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
//            Link("About my github account 🤓", destination: personalURL)
        }
    }
    
    
    
    private var coinGeckoSection: some View {
        Section(header: Text("Coin gecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("Cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko 🦎", destination: coingeckoURL)
        }
    }
    
    
    private var developerSection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This app was developed by Spencer. It uses Swift UI and is written 100% in Swift. The project benefits from multi-threading, publishers/subscribers, and data persistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit Github 🤙", destination: personalURL)
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application")) {
           
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn more", destination: defaultURL)
        }
    }
}
