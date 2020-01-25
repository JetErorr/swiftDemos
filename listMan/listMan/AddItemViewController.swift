//
//  AddItemViewController.swift
//  listMan
//
//  Created by Jeet on 18/01/20.
//  Copyright © 2020 Jeet. All rights reserved.
//

import UIKit

// Proto 1, define a protocol in Object B
protocol bringBack : class{
    var textToEdit: listModel { get set }
    var indexToEdit: Int { get set }
}// END Proto 1

class AddItemViewController: UIViewController
{
    // editDelegates will receive values from classes responding to the bringBack protocol

    // Proto 2, give object B an optional delegate var
    weak var editDelegate : bringBack?
    // END Proto 2
    
    // Text Input Box
    @IBOutlet weak var newListItem: UITextField!
    
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Proto 3, use the protocol vars / methods with the protocol delegate
        if editDelegate != nil{
            newListItem.text = editDelegate?.textToEdit.text
        }// END Proto 3
        
    }// END View Did Load
    
    // Prepare Segue, executed when leaving due to a segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! listManViewController
        
        if newListItem.text != "" {
            let newlist = listModel()
            
            newlist.text = newListItem.text!
            newlist.isDone = false
            
            // If values were passed, as in editSeg was called, update the notes array
            if editDelegate != nil{
                destVC.notes.remove(at: editDelegate!.indexToEdit)
                destVC.notes.insert(newlist, at: editDelegate!.indexToEdit)
            }
                // Else append the new element
            else {
                destVC.notes.append(newlist)
            }
        }
    }// END Prepare Segue
}// Class end
