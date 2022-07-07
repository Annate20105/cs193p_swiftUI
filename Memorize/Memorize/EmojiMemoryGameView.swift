//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Anna Dudina on 01.07.2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game:EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns:[GridItem(.adaptive(minimum:100))]) {
                    ForEach(game.cards) { card in
                        CardView(card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        Group {
            if #available(iOS 15.0, *) {
                EmojiMemoryGameView(game: game)
                //                    .previewInterfaceOrientation(.landscapeLeft)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
