//
//  listManViewController.swift
//  listMan
//
//  Created by Jeet on 17/01/20.
//  Copyright © 2020 Jeet. All rights reserved.
//

var sampleData = false

import UIKit

// Proto 4, implement protocol in Object A
class listManViewController: UITableViewController, bringBack {
    // END Proto 4
    
    // Empty text/indexToEdit to conform to bringBack protocol
    var textToEdit: listModel = listModel()
    var indexToEdit: Int = 0
    
    // Empty listModel array
    var notes: [listModel] = [listModel]()
    
    // Prepare Segue, executed when leaving due to a segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Edit item Function Block
        if segue.identifier == "editSeg" {
            
            let controller = segue.destination as! AddItemViewController
            // Set self VC as responder to the bringBack protocol
            controller.editDelegate = self
            
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                // Responding to the bringBack protocol with a value for itemToEdit
                controller.editDelegate?.textToEdit = notes[indexPath.row]
                controller.editDelegate?.indexToEdit = indexPath.row
            }
        }// END Edit item Function Block
        
    }// END Prepare Segue
    
    
    // Unwind Segue, executed when unwinding to this VC
    @IBAction func unwindToList(_ unwindSegue: UIStoryboardSegue) {
        self.tableView.reloadData()
    }// END Unwind Segue
    
    
    // // TableView setup
    
    // Return Number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (notes.count)
    }// END Return Number of rows
    
    
    // Returning Cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableRow",for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        let tick = cell.viewWithTag(1001)
        
        label.text = notes[indexPath.row].text
        
        if (notes[indexPath.row].isDone) {
            tick?.alpha = 1
        } else {
            tick?.alpha = 0
        }
        return cell
    }// END Returning Cells
    
    
    // Selecting cells, toggle checkmark
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath)
        {
            let tick = cell.viewWithTag(1001)
            if (notes[indexPath.row].isDone) {
                tick?.alpha = 0
                notes[indexPath.row].isDone = !(notes[indexPath.row].isDone)
            } else {
                tick?.alpha = 1
                notes[indexPath.row].isDone = !(notes[indexPath.row].isDone)
            }
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }// END Selecting Cells
    
    
    // Swipe to Delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            notes.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }// END Swipe to Delete
    
    // // END TableView setup
    
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var newlist = listModel()
        if sampleData == true{
        newlist.text = "List One"
        newlist.isDone = true
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "List Two"
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Walk out of the basement with your hands up"
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Brush teeth"
        newlist.isDone = true
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Learn iOS development"
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Soccer practice"
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Eat ice cream"
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Eat ice cream, again, and this is some overflowing text my guy"
        
        newlist.text = "List One"
        newlist.isDone = true
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "List Two"
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Walk out of the basement with your hands up"
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Brush teeth"
        newlist.isDone = true
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Learn iOS development"
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Soccer practice"
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Eat ice cream"
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Eat ice cream, again, and this is some overflowing text my guy"
        
        newlist.text = "List One"
        newlist.isDone = true
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "List Two"
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Walk out of the basement with your hands up"
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Brush teeth"
        newlist.isDone = true
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Learn iOS development"
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Soccer practice"
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Eat ice cream"
        notes.append(newlist)
        
        newlist = listModel()
        newlist.text = "Eat ice cream, again, and this is some overflowing text my guy"
        
        notes.append(newlist)
        }
    }// END View Did Load
    
}// END Class
