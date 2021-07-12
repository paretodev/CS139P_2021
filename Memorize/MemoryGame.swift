//
//  MemoryGame.swift
//  Memorize
//
//  Created by Dylan Han on 2021/07/05.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var oneAndOnlyCardFaceUpIndex: Int?

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
        }),
        !card.isFaceUp,
        !card.isMatched {
            if let potentialMatchCardIndex = oneAndOnlyCardFaceUpIndex {
                //일치
                if cards[potentialMatchCardIndex].content == cards[chosenIndex].content {
                    cards[potentialMatchCardIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                    
                    oneAndOnlyCardFaceUpIndex = nil
                }
                
                //불일치
                else{
                    for index in cards.indices {
                        cards[index].isFaceUp = false
                    }
                    
                    oneAndOnlyCardFaceUpIndex = nil
                }
            }

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
