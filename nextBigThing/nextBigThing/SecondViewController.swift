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
    
    //    var tableData = ["Message1", "Message2", "Message3"]
    var name = [String]()
    var answer = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dbRef = Database.database().reference()
        dbRef.child("chatApp").observe(.value) { (snapshot) in
            let fbaseValue = snapshot.value as? NSDictionary
            
            if let temp = fbaseValue{
                
                for (key, _) in temp{
                    
                    let temp2:NSObject = temp[key] as! NSObject
                    
                    self.name.append(temp2.value(forKey: "username") as! String)
                    self.answer.append(temp2.value(forKey: "answer") as! String)
                    
                }
            }
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomCell = tableView.dequeueReusableCell(withIdentifier: "listAnswer", for: indexPath) as! CustomCell
        
        cell.lblName?.text = name[indexPath.row]
        cell.lblAnswer?.text = answer[indexPath.row]
        
        return cell
    }
}
