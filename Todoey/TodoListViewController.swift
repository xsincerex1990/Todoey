//
//  ViewController.swift
//  Todoey
//
//  Created by Joel alexis on 3/19/19.
//  Copyright © 2019 Joel alexis. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var todoArray = ["Find Larry", "Buy paint", "Meditate"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: Table View Data Source Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = todoArray[indexPath.row]
        return cell
    }
    //    MARK: Table View Delegate Methods
//    when a user clicks the item deselect to de-highlight grayish section
//    also check to see if check is showing
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
         
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    //    MARK: Add new item button

    @IBAction func addBarButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
//        create alert controller
        let alert = UIAlertController(title: "Add new to-do item.", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            let stringField = textField.text!
            self.todoArray.append(stringField)
            self.tableView.reloadData()
            print(self.todoArray)
            }
//        This executes as soon as the add button is pressed once
        alert.addTextField { (alertTextField) in
            textField = alertTextField
        }
//        add action to alert
        alert.addAction(action)
//        show the alert
        present(alert, animated: true, completion: nil)
    }
}

