//
//  Array.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/10/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    static func createArray(size:Int) -> [Int] {
        var result: [Int] = []
        for _ in 0..<size {
            result.append(Int(arc4random_uniform(UInt32(size))))
        }
        return result
    }
    
    static func createArray(size: Int, range: Int) -> [Int] {
        var tempArray: [Int] = []
        for _ in 0..<size {
            tempArray.append(Int(arc4random_uniform(UInt32(range))))
        }
        return tempArray
    }
}
