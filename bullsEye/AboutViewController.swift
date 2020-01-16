//
//  AboutViewController.swift
//  bullsEye
//
//  Created by Jeet on 16/01/20.
//  Copyright © 2020 Jeet. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Making an url object which points to a ... url: instruction.html
        if let url = Bundle.main.url(forResource: "instruction", withExtension: "html") {
            
            // Assign request to the url object
            let request = URLRequest(url: url)
            
            // Execute the request and load the response
            webView.load(request)
        }
    }
    @IBAction func close() {
        
        // Dismiss the modal view, a normal segue would create a new instance of the ViewController, dissmissing it will avoid that redundency
        dismiss(animated: true, completion: nil)
    }
    
}
