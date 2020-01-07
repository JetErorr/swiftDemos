//
//  cardCell.swift
//  anotherApp
//
//  Created by Jeet on 07/01/20.
//  Copyright © 2020 Jeet. All rights reserved.
//

import Foundation

class CardCell {
    
    func getCards() -> [Card]{
        
        // Make an empty cards array
        var genCards = [Card]()
        
        // Generate pairs of cards
        for _ in 1...8{
            let aNumber = arc4random_uniform(13) + 1
            print(aNumber)
            let cardOne = Card()
            cardOne.imageName = "card\(aNumber)"
            genCards.append(cardOne)
            
            let cardTwo = Card()
            cardTwo.imageName = "card\(aNumber)"
            genCards.append(cardTwo)
            
        }
        
        // Randomize the array
        
        // Return the array
        return genCards
    }
    
}
