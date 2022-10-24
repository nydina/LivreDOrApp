//
//  LivreDOrAppApp.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 24/10/2022.
//

import SwiftUI

@main
struct LivreDOrAppApp: App {
    @StateObject var viewModel = MessageViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
