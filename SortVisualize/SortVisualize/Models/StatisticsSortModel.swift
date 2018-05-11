//
//  TimeSortModel.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/10/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class StatisticsSortModel {
    
    let arraySort = TypeSortModel()
    let repetition = 5
    
    func timeSort (sortType: TypeSortEnum, dictionary: Dictionary<Int, [Int]>) -> [String] {
        var result: [String] = []
        for (key, value) in dictionary {
            let currentDateTime = Date()
            for _ in 0..<repetition  {
                arraySort.sortArray(array: value, sortType: sortType)
            }
            let time =  Date().timeIntervalSince(currentDateTime) / Double(repetition)
            result.append("size: \(key) sorted in \(time) sec" )
        }
        return result
    }
}

