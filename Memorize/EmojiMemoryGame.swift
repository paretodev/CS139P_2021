//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Dylan Han on 2021/07/05.
//

import SwiftUI

// : ObservableObject => "sth changed" publishing enabled
class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🍎","🍊","🥝", "🍇", "🍿", "💻", "🎸", "😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 6){ pairIndex in
            emojis[pairIndex]
        }
    }
    
//    var objectWillChange: ObservableObjectPublisher
    
    @Published private( set ) var model: MemoryGame<String> = createMemoryGame()
    // model.choose(card) is a "mutating func" which mutates model.
    // swiftUI will know model has changed and auto. call objectWillChange.send( )
    // to publish changes in obj. viewmodel
    // If, you use @Published keyword for a variable
    
    var cards : Array< MemoryGame<String>.Card >{
        return model.cards
    }
    
    // MARK:- Intent(s)
    func choose(_ card: MemoryGame<String>.Card){
//        objectWillChange.send() // moment you want to publish change
        //But, even this might be unnecessary
        
        // multiple changes in obj. "EmojiMemoryGame"
        // but, swiftUI batches them all up into "one redraw" of Views that has subscribed to the changes happened.
        model.choose(card)
    }
}


/*< MVVM >
 
 * viewmodel publish to the world "sth changed" whenever, its model changes :
 
    @Published
    : ObservableObject protocol conformance
 
 *
 
 */
