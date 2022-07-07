//
//  Array+Helper.swift
//  Memorize
//
//  Created by Anna Dudina on 07.07.2022.
//

import Foundation

extension Array {

    func choose(_ n: Int) -> Array {
        Array(self.prefix(n))
    }
}
