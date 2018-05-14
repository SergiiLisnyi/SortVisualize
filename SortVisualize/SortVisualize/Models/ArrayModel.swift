//
//  Model.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/7/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class ArrayModel {
    
    var array: [Int] = []
    var lastStep = 0
    var count: Int {
        return array.count
    }
    
    init (size: Int, range: Int) {
        array = Array.createArray(size: size, range: range)
    }

    func getElement(byIndex: Int) -> Int {
        return array[byIndex]
    }
    
    private func stepSortBubble() -> (at: Int, to: Int) {
        for i in lastStep ..< array.endIndex {
            lastStep = i
            for j in 0 ..< array.endIndex - 1 {
                if array[j] > array[j + 1 ] {
                    let temp = array[j]
                    array[j] = array[j + 1]
                    array[j + 1] = temp
                    return (at: j, to: j + 1)
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
    
    private func stepSortInsert() -> (at: Int, to: Int) {
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
    
    
    func sort(type: SortArrayEnum) -> (at: Int, to: Int) {
        switch type {
        case SortArrayEnum.bubble:
            return stepSortBubble()
        case SortArrayEnum.insert:
            return stepSortInsert()
        case SortArrayEnum.selection:
            return stepSortSelection()
        default:
            return (at: 0, to: 0)
        }
    }
}
