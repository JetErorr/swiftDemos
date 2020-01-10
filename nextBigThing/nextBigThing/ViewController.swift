//
//  ViewController.swift
//  nextBigThing
//
//  Created by Jeet on 10/01/20.
//  Copyright © 2020 Jeet. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMessage: UITextField!
    
    let dbRef = Database.database().reference()
    
    var inputName:String? = ""
    var inputAnswer:String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSubmit(_ sender: Any) {

//        let dbRef = Database.database().reference()
//        let test = dbRef.child("chatApp").value(forKey: "-LyEYcMDolCRDIz_KTZu")
//        if test != nil{
//            print(test!)
//        }
        inputName = txtName.text
        inputAnswer = txtMessage.text

        if !inputName!.isEmpty && !inputAnswer!.isEmpty {
            dbRef.child("chatApp").childByAutoId().setValue(["username":inputName,"answer":inputAnswer])

            let clicked = UIAlertController(title: "Answer Submitted", message: "Thank you for voting for "+inputAnswer!+", "+inputName!, preferredStyle: .alert)
            clicked.addAction(UIAlertAction(title: "Cool", style: .default, handler: nil))

            self.present(clicked, animated: true)

        }
        else{
            let clicked = UIAlertController(title: "Error", message: "Check if the Name and Answer field are not empty", preferredStyle: .alert)
            clicked.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(clicked, animated: true)
        }
    }
}

