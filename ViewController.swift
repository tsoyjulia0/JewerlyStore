//
//  ViewController.swift
//  CardsGame
//
//  Created by Юлия Цой on 22.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let cards = [#imageLiteral(resourceName: "4"), #imageLiteral(resourceName: "5"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonDidTap(_ sender: Any) {
        let randomIndex = Int.random(in: 0..<cards.count)
        
        let guess = guessTextField.text
        if guess == String(randomIndex){
            resultLabel.text = "Correct!"
        } else {
            resultLabel.text = "Incorrect! The card was \(randomIndex+1)"
        }
    }
    
}

