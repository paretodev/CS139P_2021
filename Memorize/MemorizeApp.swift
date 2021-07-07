//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Dylan Han on 2021/06/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
