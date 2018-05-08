//
//  Model.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/7/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class Model {
    
    static let sizeModel = 10
    static let rangeModel = 1000
    
    var array: [Int] = createArray(size: sizeModel)
    var lastStep = 0
    
    var count: Int {
        return array.count
    }
    
    static func createArray(size: Int) -> [Int] {
        var tempArray: [Int] = []
        for _ in 0..<size {
            tempArray.append(Int(arc4random_uniform(UInt32(rangeModel))))
        }
        return tempArray
    }
    
    func getElement(byIndex: Int) -> Int {
        return array[byIndex]
    }
    
    private func stepSortBubble() -> (at: Int, to: Int) {
        var temp: Int = 0
        for i in lastStep ..< array.endIndex {
            lastStep = i
            for j in i ..< array.endIndex {
                if array[j] < array[i] {
                    temp = array[i]
                    array[i] = array[j]
                    array[j] = temp

                    return (at: i, to: j)
                }
            }
        }
        return (at: 0, to: 0)
    }
 
    private func stepSortSelection () -> (at: Int, to: Int) {
        for barrier in (lastStep..<array.endIndex) {
            lastStep = barrier
            for index in 0..<barrier {
                if array[barrier] < array[index] {
                    let tmp = array[index]
                    array[index] = array[barrier]
                    array[barrier] = tmp
                    
                    return (at: barrier, to: index)
                }
            }
        }
        return (at: 0, to: 0)
    }
    
    func stepSortInsert() -> (at: Int, to: Int) {
        for i in lastStep + 1 ..< array.endIndex {
            let newElem = array[i]
            let j = i - 1
            while j >= 0 && array[j] > newElem {
                array.swapAt(j + 1, j)
                return (at: j + 1, to: j)
            }
        }
        return (at: 0, to: 0)
    }
    
    
    func sort(type: SortType) -> (at: Int, to: Int) {
        switch type {
        case SortType.Bubble:
            return stepSortBubble()
        case SortType.Insert:
            return stepSortInsert()
        case SortType.Selection:
            return stepSortSelection()
        }
    }
}
