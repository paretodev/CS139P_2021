//
//  MemoryGame.swift
//  Memorize
//
//  Created by Dylan Han on 2021/07/05.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards : Array<Card>

    init(numberOfPairsOfCards: Int, createCardContent : (Int) -> CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content : CardContent = createCardContent( pairIndex )
            
            cards.append( Card(isFaceUp: false, isMatched: false, content: content) )
            cards.append( Card(isFaceUp: false, isMatched: false, content: content) )
        }
    }
    
    func choose(_ card : MemoryGame.Card){
        //...
    }

    struct Card {
        var isFaceUp : Bool
        var isMatched : Bool
        var content : CardContent // image, jpeg
    }
}
