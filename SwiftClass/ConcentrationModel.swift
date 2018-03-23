//
//  ConcentrationModel.swift
//  SwiftClass
//
//  Created by 何松泽 on 2018/2/23.
//  Copyright © 2018年 何松泽. All rights reserved.
//

import Foundation

class ConcentrationModel
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard:Int!
    
    
    func ChooseCard(at index:Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFacedUp = false
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    func ResetGame(numberOfPairsCards : Int) {
        cards = [Card]()
        for _ in 1...numberOfPairsCards {
            let card = Card()
            cards += [card, card]
        }
        //TODO Shuffle the card
        shuffle()
    }
    
    init(numberOfPairsCards : Int) {
        
        for _ in 1...numberOfPairsCards {
            let card = Card()
            cards += [card, card]
        }
        //TODO Shuffle the card
        shuffle()
    }
    func shuffle() {
        
        let tempCards = cards
        for _ in 0..<tempCards.count {
            let randomIndex = Int(arc4random_uniform(uint(tempCards.count)))
            let tempCard = cards.remove(at: randomIndex)
            cards += [tempCard]
        }
        
        
    }
}
