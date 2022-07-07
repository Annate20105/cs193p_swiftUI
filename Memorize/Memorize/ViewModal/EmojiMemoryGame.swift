//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Anna Dudina on 04.07.2022.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static var emojis:[String] = {
        var results:[String] = []
        for i in 0x1F680...0x1F69D {
            let c = String(UnicodeScalar(i) ?? "-")
            results.append(c)
        }
        return results
    }()
    
    //MARK: - MemoryGame
        
    @Published private var model = createMemoryGame(numberOfPairsOfCards: 10)
   
    
    var cards: Array<Card> {
        return model.cards
    }

    private static func createMemoryGame(numberOfPairsOfCards:Int) -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: numberOfPairsOfCards) { index in
            EmojiMemoryGame.emojis[index]
        }
    }
        
}

//MARK: - Intent(s)

extension EmojiMemoryGame {
    
    func choose(_ card:Card) {
        model.choose(card)
    }
    
}
