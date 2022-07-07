//
//  MemoryGame.swift
//  Memorize
//
//  Created by Anna Dudina on 04.07.2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards:[Card]
    
    private var indexOfTheOneAndOnlyFaceUpCard:Int?
    
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
            indexOfTheOneAndOnlyFaceUpCard = nil
        } else {
            for index in cards.indices {
                cards[index].isFaceUp = false
            }
            indexOfTheOneAndOnlyFaceUpCard = chosenIndex
        }
        
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    init(numberOfPairsOfCards:Int, createCardContent:(Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        cards = cards.shuffled()
    }
    
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content:CardContent
    }
}
