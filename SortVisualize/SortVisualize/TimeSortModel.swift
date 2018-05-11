//
//  TimeSortModel.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/10/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class TimeSortModel {
    
    let arraySort = TypeSortModel()
    let repetition = 5
    
    var data1k = Array<Int>.createArray(count: 1000)
    var data2k = Array<Int>.createArray(count: 2000)
    var data4k = Array<Int>.createArray(count: 4000)
    var data8k = Array<Int>.createArray(count: 8000)
    var data16k = Array<Int>.createArray(count: 1000) //FIXME: 16000
    
    //FIXME
    lazy var dictionaryArrays = [1000 : data1k, 2000: data2k, 4000 : data4k, 8000: data8k,16000 : data16k]
    
    func timeSort (sortType: typeSort, repetition: Int, typeArray: typeArray, dictionary: Dictionary<Int, [Int]>) {
        for (key, value) in dictionaryArrays {
            let currentDateTime = Date()
            for _ in 0..<repetition  {
                arraySort.sortArray(array: value, sortType: sortType)
            }
            let time =  Date().timeIntervalSince(currentDateTime) / Double(repetition)
            print("Array(\(typeArray)) size: \(key) sorted in \(time) second by \(sortType) method")
        }
    }
    
    func timeSort (sortType: typeSort, typeArray: typeArray) -> [String] {
        var result: [String] = []
        for (key, value) in dictionaryArrays {
            let currentDateTime = Date()
            for _ in 0..<repetition  {
                arraySort.sortArray(array: value, sortType: sortType)
            }
            let time = Date().timeIntervalSince(currentDateTime) / Double(repetition)
            result.append("size: \(key) sorted in \(time) sec" )
        }
        return result
    }
 
}

enum typeArray {
    case simple
    case sorted
    case reverse
}
