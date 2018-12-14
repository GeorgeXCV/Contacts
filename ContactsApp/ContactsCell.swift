//
//  ContactsCell.swift
//  ContactsApp
//
//  Created by George on 13/12/2018.
//  Copyright © 2018 George. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    var link: ViewController?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        let starButton = UIButton(type: .system)
        starButton.setImage(#imageLiteral(resourceName: "fav_star"), for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        starButton.tintColor = .red
        starButton.addTarget(self, action: #selector(handleMarkAsFavourite), for: .touchUpInside)
        
        accessoryView = starButton
    }
    
    @objc private func handleMarkAsFavourite() {
           link?.someMethodIWantToCall(cell: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
