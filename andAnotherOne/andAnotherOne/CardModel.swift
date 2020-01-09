//
//  CardModel.swift
//  andAnotherOne
//
//  Created by Jeet on 07/01/20.
//  Copyright © 2020 Jeet. All rights reserved.
//

import Foundation


class CardModel{
    func getCards() -> [Card] {
        var genCards = [Card]()
        var generatedNumArray = [Int]()
        
        while generatedNumArray.count < 8{
            let aNumber = arc4random_uniform(13) + 1
            
            if generatedNumArray.contains(Int(aNumber)) == false
            {
                print(aNumber)
                
                generatedNumArray.append(Int(aNumber))
                
                let cardOne = Card()
                cardOne.imageName = "card\(aNumber)"
                genCards.append(cardOne)
                
                let cardTwo = Card()
                cardTwo.imageName = "card\(aNumber)"
                genCards.append(cardTwo)
            }
            
            genCards.shuffle()
        }
        
        return genCards
    }
}
