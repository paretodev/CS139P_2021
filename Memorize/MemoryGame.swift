//
//  MemoryGame.swift
//  Memorize
//
//  Created by Dylan Han on 2021/07/05.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards : Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?

    init(numberOfPairsOfCards: Int, createCardContent : (Int) -> CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content : CardContent = createCardContent( pairIndex )
            
            cards.append( Card(isFaceUp: false, isMatched: false, content: content, id: pairIndex*2) )
            cards.append( Card(isFaceUp: false, isMatched: false, content: content, id: pairIndex*2+1) )
        }
    }
    
    mutating func choose(_ card : MemoryGame.Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                
                indexOfTheOneAndOnlyFaceUpCard = nil
            }
    
            else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }
    
        print("model's cards array : \n\(cards)")
    }
    
    struct Card: Identifiable {
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        var content : CardContent
        var id: Int
    }
}
