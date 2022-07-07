//
//  Theme.swift
//  Memorize
//
//  Created by Anna Dudina on 05.07.2022.
//

import Foundation
import SwiftUI


struct Theme {
    
    let emojis:[String]
    let color: Color
    let title: String
    let numberOfPairs:Int
    
}

extension Theme {
    var currentGameEmojis:[String] {
        emojis.shuffled().choose(Int.random(in: 8..<10))
    }
}
