//
//  MemoryGame.swift
//  Memorize
//
//  Created by Anna Dudina on 04.07.2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards:[Card] = []
    
    private var indexOfTheOneAndOnlyFaceUpCard:Int? {
        set {
            cards.indices.forEach({cards[$0].isFaceUp = ($0 == newValue)})
        }
        get {
            cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly
        }
    }
    
    mutating func choose(_ card:Card) {
        guard let chosenIndex
                = cards.firstIndex(where: {$0.id == card.id}) else {
            return
        }
        guard !cards[chosenIndex].isFaceUp,
              !cards[chosenIndex].isMatched else {
            return
        }
        if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
            if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
            cards[chosenIndex].isFaceUp = true
        } else {
            indexOfTheOneAndOnlyFaceUpCard = chosenIndex
        }
    }
    
    init(numberOfPairsOfCards:Int, createCardContent:(Int) -> CardContent) {
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
    
    
    struct Card: Identifiable {
        let id: Int
        var isFaceUp = false
        var isMatched = false
        let content:CardContent
    }
}


extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        }
        return nil
    }
}
