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
    private var visitedIndicesHistory: Set<Int> = []
    private(set) var gameScore = 0


    init(numberOfPairsOfCards: Int, createCardContent : (Int) -> CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content : CardContent = createCardContent( pairIndex )
            
            cards.append( Card(isFaceUp: false, isMatched: false, content: content, id: pairIndex*2 ) )
            cards.append( Card(isFaceUp: false, isMatched: false, content: content, id: pairIndex*2 + 1 ) )
        }
    }
    
    mutating func choose(_ card : MemoryGame<CardContent>.Card){
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
                    
                    gameScore += 2
                }
                //불일치
                else{
                    if visitedIndicesHistory.contains(potentialMatchCardIndex) && visitedIndicesHistory.contains(chosenIndex){
                        gameScore -= 2
                    }
                }
                
                //일치 + 불일치
                oneAndOnlyCardFaceUpIndex = nil
            }
            
            else{
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                oneAndOnlyCardFaceUpIndex = chosenIndex
            }
            
            //MARK:- At the end, toggle !!
            cards[chosenIndex].isFaceUp.toggle()
            
            visitedIndicesHistory.insert(chosenIndex)
        }
    }

    struct Card: Identifiable {
        var isFaceUp : Bool
        var isMatched : Bool
        var content : CardContent
        
        var id: Int
    }
}
