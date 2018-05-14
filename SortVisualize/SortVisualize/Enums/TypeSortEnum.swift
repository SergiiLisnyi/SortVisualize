//
//  TypeSortEnum.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/11/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

enum TypeSortEnum: Int {
    case quick = 0
    case merge
    case bubble
    case insert
    case selection
    
    var title: (String) {
        switch self {
        case .bubble:
            return ("Sort Bubble")
        case .insert:
            return ("Sort Insert")
        case .selection:
            return ("Sort Selection")
        case .merge:
            return ("Sort Merge")
        case .quick:
            return ("Sort Quick")
        }
    }
    
    static let count: Int = {
        var max: Int = 0
        while let _ = TypeSortEnum(rawValue: max) { max += 1 }
        return max
    }()
}
