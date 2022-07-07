//
//  String+Emoji.swift
//  Memorize
//
//  Created by Anna Dudina on 05.07.2022.
//

import Foundation
import SwiftUI

enum EmojiType: CaseIterable {
    
    case emoticons
    case miscSymbols
    case dingbats
    case transport
    case flags
    
    
    var emojisRange:ClosedRange<Int> {
        
        switch self {
        case .emoticons:
            return 0x1F600...0x1F64F
        case .miscSymbols:
            return 0x2600...0x26FF
        case .dingbats:
            return 0x2700...0x27BF
        case .transport:
            return 0x1F680...0x1F69D
        case .flags:
            return 0x1F1E6...0x1F1FF
        }
    }
    
    var title:String {
        switch self {
        case .emoticons:
            return "Emoticons"
        case .miscSymbols:
            return "Misc Symbols"
        case .dingbats:
            return "Dingbats"
        case .transport:
            return "Transport"
        case .flags:
            return "Flags"
        }
    }
    
    var color:Color {
        switch self {
        case .emoticons:
            return .blue
        case .miscSymbols:
            return .black
        case .dingbats:
            return .yellow
        case .transport:
            return .pink
        case .flags:
            return .orange
        }
    }
    
    
}

