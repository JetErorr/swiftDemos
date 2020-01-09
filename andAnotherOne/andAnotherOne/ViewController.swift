//
//  ViewController.swift
//  andAnotherOne
//
//  Created by Jeet on 07/01/20.
//  Copyright © 2020 Jeet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var model = CardModel()
    var cardArray = [Card]()
    
    var firstFlippedCardIndex:IndexPath?
    
    var timer:Timer?
    var milliseconds:Float = 120_000 // 2 mins
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardArray = model.getCards()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Repeat calls to a function
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        
        // Don't stop the timer loop while user interaction is being registered
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        soundManager.playSound(.shuffle)
    }
    
    @objc func timerElapsed() {
        
        // Count down
        milliseconds -= 1
        
        // Convert to seconds
        let seconds = String(format: "%.2f", milliseconds/1000)
        
        // Label
        timerLabel.text = "Countdown: \(seconds)"
        
        // Stop timer at 0
        if milliseconds <= 0{
            timer?.invalidate()
            timerLabel.textColor = UIColor.red
            
            checkGameEnded()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        let card = cardArray[indexPath.row]
        
        cell.setCard(card)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Don't allow user to click after the timer runs out
        if milliseconds <= 0 {
            return
        }
        
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        let card = cardArray[indexPath.row]
        
        if !card.isFlipped && card.isMatched == false{
            
            cell.flip()
            
            // Playing sound
            soundManager.playSound(.flip)
            
            card.isFlipped = true
            
            if firstFlippedCardIndex == nil{
                firstFlippedCardIndex = indexPath
                
            }
            else {
                checkForMatches(indexPath)
            }
        }
    }
    
    func checkForMatches(_ secondFlippedCardIndex:IndexPath) {
        
        // Get cells
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
        
        // Get cards
        let cardOne = cardArray[firstFlippedCardIndex!.row]
        let cardTwo = cardArray[secondFlippedCardIndex.row]
        
        // Compare the card names
        if cardOne.imageName == cardTwo.imageName
        {
            soundManager.playSound(.match)
            
            // Keep matched cards from displaying again
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            // Remove from display
            cardOneCell?.remove()
            cardTwoCell?.remove()
            
            checkGameEnded()
            
        }
        else{
            
            soundManager.playSound(.nomatch)
            
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            // Flip down the cards if not matched
            cardOneCell?.flipBack()
            cardTwoCell?.flipBack()
        }
    
        if cardOneCell == nil{
            collectionView.reloadItems(at: [firstFlippedCardIndex!])
        }
        
        // Clear the "previous" card state for next pair matching
        firstFlippedCardIndex = nil
        
    }
    
    func checkGameEnded(){
        // Check whether any cards are left unmatched
        var isWon = true
        
        for card in cardArray{
            if card.isMatched == false{
                isWon = false
                break
            }
        }
        
        var title = ""
        var message = ""
        
        if isWon == true{
            if milliseconds > 0{
                timer?.invalidate()
            }
            
            title = "Congratulations"
            message = "You've Won!"
        }
        else{
            
            if milliseconds > 0{
                return
            }
            
            title = "Game Over"
            message = "You've Lost"
            
        }
        
        showAlert(title, message)
        
    }
    
    
    func showAlert(_ title:String, _ message:String){
        
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
    }
}

