//
//  Card.swift
//  Memorize
//
//  Created by Anna Dudina on 01.07.2022.
//

import SwiftUI

struct CardView: View {
    
    private let card:EmojiMemoryGame.Card
    
    init(_ card:EmojiMemoryGame.Card) {
        self.card = card
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content)
                        .font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size:CGSize) -> Font {
        Font.system(size: min(size.width, size.height)*DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale = 0.8
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        let card = MemoryGame<String>.Card(id: -1, isFaceUp: true, content: "%)")
        CardView(card)
    }
}
