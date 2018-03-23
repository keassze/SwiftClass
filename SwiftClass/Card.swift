//
//  Card.swift
//  SwiftClass
//
//  Created by 何松泽 on 2018/2/23.
//  Copyright © 2018年 何松泽. All rights reserved.
//

import Foundation

struct Card {
    var isFacedUp = false
    var isMatched = false
    var isResetGame = false
    
    var identifier:Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int
    {
        identifierFactory += 1
        return identifierFactory
    }
    
    static func getNewUniqueIdentifier() -> Int
    {
        identifierFactory = 1
        return identifierFactory
    }

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}






