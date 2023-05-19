//
//  SwiftUICryptoApp.swift
//  SwiftUICrypto
//
//  Created by Loic HACHEME on 08/05/2023.
//

import SwiftUI

@main
struct SwiftUICryptoApp: App {
    @StateObject private var vm = HomeViewModel()
    
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(Color.theme.accent)
            
        ]
        
        UINavigationBar.appearance().titleTextAttributes  = [
            .foregroundColor: UIColor(Color.theme.accent)
            
        ]
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
