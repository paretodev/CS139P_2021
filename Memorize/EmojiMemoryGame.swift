//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Dylan Han on 2021/07/05.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🍎","🍊","🥝", "🍇", "🍿", "💻", "🎸", "😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        
        MemoryGame<String>(numberOfPairsOfCards: 5){ pairIndex in
            emojis[pairIndex]
        }
        
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: [ MemoryGame<String>.Card ] {
        model.cards
    }
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    var gameScore: Int {
        model.gameScore
    }
}
