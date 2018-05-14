//
//  TimeSortModel.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/10/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class StatisticsSortModel {
    
    static let repetition = 5
    
    static func timeSort (sortType: SortArrayEnum, dictionary: Dictionary<Int, [Int]>) -> [String] {
        var result: [String] = []
        for (key, value) in dictionary {
            let currentDateTime = Date()
            for _ in 0..<repetition  {
               TypeSortModel.sortArray(array: value, sortType: sortType)
            }
            let time =  Date().timeIntervalSince(currentDateTime) / Double(repetition)
            result.append("size: \(key) sorted in \(time) sec" )
        }
        return result
    }
}

