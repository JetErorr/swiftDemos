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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func dealButton(_ sender: Any) {
        leftCard.image = UIImage(named: "card\(Int.random(in: 2...14))")
        rightCard.image = UIImage(named: "card\(Int.random(in: 2...14))")

    }
    
}

