//
//  Card.swift
//  concentrate
//
//  Created by hien tran on 2/3/20.
//  Copyright © 2020 hien tran. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier = 0
    
    static var uniqueIdentifier = 0
    
    static func getUniqueIdentifier() -> Int {
        uniqueIdentifier += 1
        return uniqueIdentifier
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
