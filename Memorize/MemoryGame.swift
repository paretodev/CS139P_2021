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
            
            cards.append( Card(isFaceUp: true, isMatched: false, content: content, id: pairIndex*2) )
            cards.append( Card(isFaceUp: true, isMatched: false, content: content, id: pairIndex*2+1) )
        }
    }
    
    mutating func choose(_ card : MemoryGame.Card){
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("chosen card : \(cards[chosenIndex])")
        print("model's cards array : \n\(cards)")
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        
        return 0 // bogus!
    }

    //MemoryGame.Card
    struct Card: Identifiable {
        var isFaceUp : Bool
        var isMatched : Bool
        var content : CardContent // image, jpeg
        var id: Int // don't care type, hashable + equatable
    }
}
