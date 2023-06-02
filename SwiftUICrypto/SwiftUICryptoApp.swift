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
    @State private var showLaunchView: Bool = true
    
    
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
            
            ZStack {
                NavigationView {
                    HomeView()
                        .navigationBarHidden(true)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .environmentObject(vm)
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }.zIndex(2.0)
                
               
                
            }
           
        }
    }
}
