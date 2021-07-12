//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Dylan Han on 2021/06/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            
            ContentView(viewModel: game)
        }
    }
}
