//
//  ViewController.swift
//  concentrate
//
//  Created by hien tran on 2/3/20.
//  Copyright © 2020 hien tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var emojiChoices = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
    let game = Concentrate(numberOfPairsOfCards: 8)
    var flipCounter = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }

    @IBOutlet var cardButtons: [UIButton]!

    @IBOutlet weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardIndex = cardButtons.firstIndex(of: sender) {
            flipCounter += 1
            
            game.chooseCard(at: cardIndex)
            renderViewAfterChose()
        } else {
            print("Chose card not in cardButtons")
        }
    }
    
    private func  updateFlipCountLabel() {
        let attributes : [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        ]
        let attributedString = NSAttributedString(string: "Flip: \(flipCounter)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    func renderViewAfterChose() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count - 1)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

