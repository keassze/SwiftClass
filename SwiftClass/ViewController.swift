//
//  ViewController.swift
//  SwiftClass
//
//  Created by 何松泽 on 2018/2/22.
//  Copyright © 2018年 何松泽. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0 {
        didSet {
            flipLabel.text = "FlipCount:\(flipCount)"
        }
    }
    
    lazy var game = ConcentrationModel(numberOfPairsCards : (cardButtons.count + 1)/2)

    @IBOutlet weak var flipLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!

    @IBAction func ClickCard(_ sender: UIButton) {
        
        if let carNumber = cardButtons.index(of: sender) {
            flipCount += 1
            game.ChooseCard(at: carNumber)
            updateViewFromModel()
        }else {
            print("CarNumber is nil")
        }
        
    }
    
    func updateViewFromModel () {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFacedUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            button.isEnabled = !card.isMatched
        }
    }
    //Array
    var choicesArr = ["👻","🦔","🐕","🦁","🐳","🐓"]
    //Dictionary
    var emoji = [Int : String]()
    //SetEmojiForCard
    func emoji(for card : Card) -> String {
        if emoji[card.identifier] == nil ,choicesArr.count > 0 {
            let randomIndex = Int(arc4random_uniform(uint(choicesArr.count)))
            emoji[card.identifier] = choicesArr.remove(at: randomIndex )
        }

        return emoji[card.identifier] ?? "?"
    }
    
    //ResetGame
    @IBAction func RestartGame(_ sender: UIButton) {
//        for index in cardButtons.indices {
//            let button = cardButtons[index]
//            flipCount = 0
//            button.setTitle("", for: UIControlState.normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//        }
//        game.ResetGame(numberOfPairsCards : (cardButtons.count + 1)/2)
        let nextVC = NextViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("This=====Disappear")
    }
        
        
}


















