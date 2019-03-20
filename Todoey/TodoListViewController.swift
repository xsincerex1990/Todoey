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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
         
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }

}

