//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Anna Dudina on 04.07.2022.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    private var themes:[Theme]
    
    
//    private static var emojis:[String] = {
//        var results:[String] = []
//        for i in 0x1F680...0x1F69D {
//            let c = String(UnicodeScalar(i) ?? "-")
//            results.append(c)
//        }
//        return results
//    }()
//
    //MARK: - Init
    
    init(themes:[Theme]) {
        self.themes = themes
    }
    
    //MARK: - MemoryGame
        
    @Published private var model: MemoryGame<String>?
    @Published private var theme: Theme?
   
    
    var cards: Array<MemoryGame<String>.Card> {
        return model?.cards ?? []
    }
    
    var currentThemeTitle: String {
        return theme?.title ?? ""
    }
    
    var currentThemeColor: Color {
        return theme?.color ?? .red
    }
    
    func createMemoryGame(emojis:[String],
                          numberOfPairsOfCards:Int) -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: numberOfPairsOfCards) { index in
            emojis[index]
        }
    }
        
}

//MARK: - Intent(s)

extension EmojiMemoryGame {
    
    func choose(_ card:MemoryGame<String>.Card) {
        model?.choose(card)
    }
    
    func randomGame() {
        theme = themes.randomElement()
        guard let theme = theme else {
            return
        }
        
        var numberOfPairs = theme.numberOfPairs
        if numberOfPairs > theme.currentGameEmojis.count {
            numberOfPairs = theme.currentGameEmojis.count
        }
        model = createMemoryGame(emojis: theme.currentGameEmojis,
                                 numberOfPairsOfCards:numberOfPairs)
    }
    
}
