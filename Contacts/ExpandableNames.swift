//
//  ExpandableNames.swift
//  Contacts
//
//  Created by George on 13/12/2018.
//  Copyright © 2018 George. All rights reserved.
//

import Foundation

struct ExpandableNames {
    
    var isExpanded: Bool
    var names: [Contact]
}

struct Contact {
    let name: String
    var hasFavourited: Bool
}

