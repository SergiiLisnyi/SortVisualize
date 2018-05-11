//
//  Array.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/10/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

extension Array {
    
    static func createArray(count:Int) -> [Int] {
        var result: [Int] = []
        for _ in 0..<count {
            result.append(Int(arc4random_uniform(UInt32(count))))
        }
        return result
    }
}
