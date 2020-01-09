//
//  CardCollectionViewCell.swift
//  andAnotherOne
//
//  Created by Jeet on 07/01/20.
//  Copyright © 2020 Jeet. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func setCard(_ card:Card){
        self.card = card
        
        if card.isMatched{
            frontImageView.alpha = 0
            backImageView.alpha = 0
            
            return
        }
        else{
            frontImageView.alpha = 1
            backImageView.alpha = 1
        }
        
        frontImageView.image = UIImage(named: card.imageName)
        
        
        if card.isFlipped == true{
            UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)

        }else{
            UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)

        }
    }

    func flip(){
        
        // Flip to show card face
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipBack(){
        
        // Adding a 500ms delay before flipping back
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            // Flip to hide card face
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 0.6, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
        
    }
    func remove(){
        
        // Removed the matched cards
        backImageView.alpha = 0
        
        // Animate out
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontImageView.alpha = 0
        }, completion: nil)
        
    }
    
}
