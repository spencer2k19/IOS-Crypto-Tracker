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
