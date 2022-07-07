//
//  ContentView.swift
//  Memorize
//
//  Created by Anna Dudina on 01.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel:EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text(viewModel.currentThemeTitle)
                .padding(.all)
            ScrollView {
                LazyVGrid(columns:[GridItem(.adaptive(minimum:65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.currentThemeColor)
            Spacer()
            HStack {
                Button {
                    viewModel.randomGame()
                } label: {
                    Text("NEW GAME")
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
            }
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame(themes: [Theme(emojis: [":)", "$", "we", "4"],
                                                  color: .accentColor,
                                                  title: "Test",
                                                  numberOfPairs: 4)])
        
        Group {
            if #available(iOS 15.0, *) {
                ContentView(viewModel: game)
                //                    .previewInterfaceOrientation(.landscapeLeft)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
