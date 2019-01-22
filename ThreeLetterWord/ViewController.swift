//
//  ViewController.swift
//  ThreeLetterWord
//
//  Created by Bailey Carlson on 1/8/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentLetterLabel: UILabel!
    @IBOutlet var labels: [UILabel]!
    @IBOutlet weak var stackView: UIStackView!
    
    let letters: [String] = ["A", "B", "C", "D", "E", "F", "G", "H","I", "J", "K", "L", "M", "N", "O", "P","Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    var counter: Int = 0
    var currentLetter: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAndSetCurrentLetters()
    }
    @IBAction func whenTapped(_ sender: UITapGestureRecognizer) {
        let selectedPoint = sender.location(in: stackView)
        for label in labels {
            if label.frame.contains(selectedPoint) {
                label.text = currentLetter
            }
            
        }
        counter += 1
        if counter == 26 {
            counter = resetCounter()
        }
        getAndSetCurrentLetters()
    }
    
    func getAndSetCurrentLetters() {
        currentLetter = letters[counter]
        currentLetterLabel.text = currentLetter
    }
    func resetCounter() -> Int {
        let alert = UIAlertController(title: "Resetting Counter", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (alert) in
            for label in self.labels {
                label.text = "?"
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        return 0
    }

}

