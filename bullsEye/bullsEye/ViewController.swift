//
//  ViewController.swift
//  bullsEye
//
//  Created by Jeet on 16/01/20.
//  Copyright © 2020 Jeet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Connecting outlets
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var mainSlider: UISlider!
    
    // Declaring and assigning initialization values
    var roundValue = 0
    var targetValue = 0
    var scoreValue = 0
    
    // Button to start next round
    @IBAction func checkScore(_ sender: Any) {
        
        // Execute the alert function
        alertScore(mainSlider)
    }
    
    
    // Resets all counters
    @IBAction func resetGame(_ sender: Any) {
        
        // Reset and Display Score Counter to 0
        scoreValue = 0
        scoreLabel.text = String(scoreValue)
        
        // Reset and Display Round Counter to 0
        roundValue = 0
        roundLabel.text = String(roundValue)
        
        // Generate new round values
        newRound()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Reset all counters when app launches
        resetGame((Any).self)
    }
    
    // Generate new round values
    func newRound(){
        
        // Generate and display new target value
        targetValue = Int.random(in: 0...100)
        targetLabel.text = String(targetValue)
        
        // Increment and Display Round number
        roundValue+=1
        roundLabel.text = String(roundValue)
        
        // Display / Refresh latest Score
        scoreLabel.text = String(scoreValue)
    }
    
    // Show an alert with the Score
    func alertScore(_ slider: UISlider){
        
        // Calculate Difference between Target and Current Value
        let diff:Int = abs(Int(slider.value) - targetValue)
        
        // Calculate Current Round Score
        let score = 100 - diff
        
        // Add Current Round Score to Running Total Score
        scoreValue += score
        
        // Display Current Round Score as an alert
        let answerAlert = UIAlertController(title: "You were \(diff) point/s off", message: "You got \(score) points", preferredStyle: .alert)
        
        // Dismiss alert
        let alertButton = UIAlertAction(title: "New Round", style: .default, handler: nil)
        answerAlert.addAction(alertButton)
        
        // Generate new round values
        present(answerAlert, animated: true, completion: {self.newRound()})
    }
    
}
