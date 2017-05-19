//
//  ViewController.swift
//  Adding_BeastList
//
//  Created by Marvin Alganes on 5/15/17.
//  Copyright © 2017 Marvin Alganes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    var tasks: [String] = [String]()
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // When button is pressed, we are adding new items in the array and it should display on the screen by the tableView.reloadData()
    
    @IBAction func beastButton(_ sender: UIButton) {
        if sender.tag == 1{
            tasks.append(taskTextField.text!)
            print("Pressing Beast Button")
            print(tasks)
            tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension ViewController: UITableViewDataSource{
    
    // This function returns how many items are in the tasks array: numbersOfRows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    // This function creates the array items and place into a cell, cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    
    // function to remove items from the array
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and row \(indexPath.row) are selected!")
        tasks.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    
    
    
    
    
}

