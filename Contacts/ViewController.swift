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
    
    func someMethodIWantToCall(cell: UITableViewCell) {
        
        // Figure out which name we're clicking on
        
        guard let indexPathTapped = tableView.indexPath(for: cell) else { return }
        
        let contact = nameDimensionalArray[indexPathTapped.section].names[indexPathTapped.row]
        print(contact)
        
        let hasFavourited = contact.hasFavourited
        nameDimensionalArray[indexPathTapped.section].names[indexPathTapped.row].hasFavourited = !hasFavourited
        
        cell.accessoryView?.tintColor = hasFavourited ? UIColor.lightGray : .red
    }
    
    var nameDimensionalArray = [
        
        ExpandableNames(isExpanded: true, names: ["Adam", "Bill", "Jill", "Lisa", "Bart"].map{ Contact(name: $0, hasFavourited: false) }),
        ExpandableNames(isExpanded: true, names: [ "Carl", "Lenny", "Moe", "Homer" ].map{ Contact(name: $0, hasFavourited: false) }),
        ExpandableNames(isExpanded: true, names: [ "Stan", "Kenny", "Kyle", "Cartman" ].map{ Contact(name: $0, hasFavourited: false) }),
        ExpandableNames(isExpanded: true, names: [Contact(name: "Patrick", hasFavourited: false)]),
    ]
    
    var showIndexPaths = false
    
    @objc func handleShowIndexPath() {
        print("Attemping reload animation of indexPaths...")
        
        // Build indexPaths we want to reload
        var indexPathsToReload = [IndexPath]()
        
        for section in nameDimensionalArray.indices {
            for row in nameDimensionalArray[section].names.indices {
                        print(section, row)
                let indexPath = IndexPath(row: row, section: section)
                indexPathsToReload.append(indexPath)
            }
        }
        
        showIndexPaths = !showIndexPaths
        
        let animationStyle = showIndexPaths ? UITableView.RowAnimation.right : .left
        
        tableView.reloadRows(at: indexPathsToReload, with: animationStyle)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add Button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
       
        // Set Title
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Register cell
        tableView.register(ContactCell.self, forCellReuseIdentifier: cellID)
    
    }
}

extension ViewController {
    
    // Create label for sections
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        
        button.tag = section
        
        return button
    }
    
    @objc func handleExpandClose(button: UIButton) {
        print("Trying to expand and close section...")
        
        let section = button.tag
        
        // Close section by deleteing rows
        var indexPaths = [IndexPath]()
        for row in nameDimensionalArray[section].names.indices {
            print(0, row)
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = nameDimensionalArray[section].isExpanded
        nameDimensionalArray[section].isExpanded = !isExpanded
        
        button.setTitle(isExpanded ? "Open" : "Close", for: .normal)
        
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
    
     override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
   override func numberOfSections(in tableView: UITableView) -> Int {
        return nameDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !nameDimensionalArray[section].isExpanded {
            return 0
        }
        return nameDimensionalArray[section].names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ContactCell
        cell.link = self
        
        let contact = nameDimensionalArray[indexPath.section].names[indexPath.row]
        
        cell.textLabel?.text = contact.name
        
        cell.accessoryView?.tintColor = contact.hasFavourited ? UIColor.red : .lightGray
        
        if showIndexPaths {
            cell.textLabel?.text = "\(contact.name)   Section:\(indexPath.section) Row:\(indexPath.row)"
        }
        
        return cell
    }
}

