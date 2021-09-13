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
        MemoryGame<String>(numberOfPairsOfCards: 6){ pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private( set ) var model: MemoryGame<String> = createMemoryGame()

    var cards : Array< MemoryGame<String>.Card >{
        return model.cards
    }
    
    // MARK:- Intent(s)
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
