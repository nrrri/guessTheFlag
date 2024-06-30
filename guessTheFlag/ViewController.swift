//
//  ViewController.swift
//  guessTheFlag
//
//  Created by Narissorn Chowarun on 2024-06-26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnwser = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       countries += ["estonia", "france", "germany", "ireland", "italy", "monaco" , "nigeria" , "poland", "russia", "spain", "uk", "us"]
        
        btn1.layer.borderWidth = 1
        btn2.layer.borderWidth = 1
        btn3.layer.borderWidth = 1
        
        btn1.layer.borderColor = UIColor.gray.cgColor
        btn2.layer.borderColor = UIColor.gray.cgColor
        btn3.layer.borderColor = UIColor.gray.cgColor
        
        askQuestion()
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnwser = Int.random(in: 0...2)
    
        btn1.setImage(UIImage(named: countries[0]), for: .normal)
        btn2.setImage(UIImage(named: countries[1]), for: .normal)
        btn3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnwser].uppercased()
    }

    @IBAction func btnTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnwser {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            if (score > 0) {
                score -= 1
            } else {
                score = 0
            }
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
    
    
}

