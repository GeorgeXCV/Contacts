//
//  ViewController.swift
//  Contacts
//
//  Created by George on 13/12/2018.
//  Copyright © 2018 George. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellID = "cellID"
    
    let nameDimensionalArray = [
        ["Adam", "Bill", "Jill", "Lisa", "Bart" ],
        [ "Carl", "Lenny", "Moe", "Homer" ],
        [ "Stan", "Kenny", "Kyle", "Cartman" ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Set Title
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Register cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    
    }
}

extension ViewController {
    
    // Create label for sections
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Section"
        label.backgroundColor = UIColor.lightGray
        return label
    }
    
   override func numberOfSections(in tableView: UITableView) -> Int {
        return nameDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return nameDimensionalArray[section].count

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        let name = nameDimensionalArray[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = name
        
        cell.textLabel?.text = "\(name) Section:\(indexPath.section) Row: \(indexPath.row)"
        
        return cell
        
    }
    
  
}

