//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Dylan Han on 2021/07/05.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🍎","🍊","🥝", "🍇", "🍿", "💻", "🎸", "😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣"]
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 4){ pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
}
