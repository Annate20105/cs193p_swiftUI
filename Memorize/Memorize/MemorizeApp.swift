//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Anna Dudina on 01.07.2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame(themes: MemorizeApp.themes)
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

//MARK: -

extension MemorizeApp {
    
    static var themes:[Theme] {
        var themes:[Theme] = []
        
        for type in EmojiType.allCases {
            themes.append(Theme(emojis: type.emojisRange.emojis,
                                color: type.color,
                                title: type.title,
                                numberOfPairs: Int.random(in: 8..<10)))
            
        }
        return themes
    }

    
}
