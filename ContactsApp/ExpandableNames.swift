//
//  ExpandableNames.swift
//  ContactsApp
//
//  Created by George on 13/12/2018.
//  Copyright © 2018 George. All rights reserved.
//

import Foundation
import Contacts

struct ExpandableNames {
    var isExpanded: Bool
    var names: [FavouritableContact]
}

struct FavouritableContact {
    let contact: CNContact 
    var hasFavourited: Bool
}

