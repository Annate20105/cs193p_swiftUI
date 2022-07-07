//
//  String+Helper.swift
//  Memorize
//
//  Created by Anna Dudina on 07.07.2022.
//

import SwiftUI

extension ClosedRange where Bound == Int {
    
    var emojis: [String] {
        var results:[String] = []
        for i in self {
            let c = String(UnicodeScalar(i) ?? "-")
            results.append(c)
        }
        return Array<String>(results)
    }
}
