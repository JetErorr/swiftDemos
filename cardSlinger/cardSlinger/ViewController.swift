//
//  ViewController.swift
//  cardSlinger
//
//  Created by Jeet on 06/01/20.
//  Copyright © 2020 Jeet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftCard: UIImageView!
    
    @IBOutlet weak var rightCard: UIImageView!
    
    @IBOutlet weak var playerScoreNo: UILabel!
    
    @IBOutlet weak var cpuScoreNo: UILabel!
    
    var leftScore = 0
    var rightScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func dealButton(_ sender: Any) {
        let leftRandom = Int.random(in: 2...14)
        let rightRandom = Int.random(in: 2...14)
        
        leftCard.image = UIImage(named: "card\(leftRandom)")
        rightCard.image = UIImage(named: "card\(rightRandom)")
        
        if( leftRandom > rightRandom ){
            leftScore += 1
            playerScoreNo.text = String(leftScore)
        }else if( leftRandom < rightRandom ){
            rightScore += 1
            cpuScoreNo.text = String(rightScore)
        }
    
    }
    
}

