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
            
            cards.append( Card(isFaceUp: false, isMatched: false, content: content, id: pairIndex*2 ) )
            cards.append( Card(isFaceUp: false, isMatched: false, content: content, id: pairIndex*2 + 1 ) )
        }
    }
    
    mutating func choose(_ card : MemoryGame.Card){
        if let chosenIndex = cards.firstIndex(where: {cardInArray in
            cardInArray.id == card.id
        })
        , !card.isFaceUp
        , !card.isMatched{
            //
            
            //
            
            //
            
            // 어떤 것이던 고른 카드는 toggle
            cards[chosenIndex].isFaceUp.toggle()
        }
    }

    struct Card: Identifiable {
        var isFaceUp : Bool
        var isMatched : Bool
        var content : CardContent
        
        var id: Int
    }
}
