//
//  SecondViewController.swift
//  nextBigThing
//
//  Created by Jeet on 10/01/20.
//  Copyright © 2020 Jeet. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class SecondViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dbRef = Database.database().reference()
        let test = dbRef.value(forKeyPath: "chatApp")
        if test != nil{
            print(test!)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listAnswer", for: indexPath)
        return cell
    }
    
}
