//
//  TypeArrays.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/11/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

enum TypeArrayEnum {
    case simple
    case sorted
    case reverse
    
    var title: (String) {
        switch self {
        case .simple:
            return ("SimpleArrays")
        case .sorted:
            return ("SortedArrays")
        case .reverse:
            return ("ReverceArrays")
        }
    }
}
