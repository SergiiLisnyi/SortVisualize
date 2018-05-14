//
//  TimeModel.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/10/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class TypeSortModel {
    
    //sort "Bubble"
    static func sortBubble (_ array: [Int]) -> [Int] {
        var arr = array
        for barrier in (0..<arr.endIndex).reversed() {
            for i in 0..<barrier {
                if arr[i] > arr[i + 1] {
                    let tmp = arr[i]
                    arr[i] = arr[i + 1]
                    arr[i + 1] = tmp
                }
            }
        }
        return arr
    }
    
    // sort "Insert"
    static func sortInsert (_ array: [Int]) -> [Int] {
        var arr = array
        for k in (1..<arr.endIndex) {
            let newElement = arr[k]
            var location = k - 1
            while ((location >= 0) && (arr[location]) > newElement) {
                arr[location + 1] = arr[location]
                location = location - 1
            }
            arr [location + 1] = newElement
        }
        return arr
    }
    
    //sortMerge
    static func sortMerge(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        let middleIndex = array.count / 2
        let leftArray = sortMerge(Array(array[0..<middleIndex]))
        let rightArray = sortMerge(Array(array[middleIndex..<array.count]))
        return merge(leftArray, rightArray)
    }
    
    static func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        var orderedArray: [Int] = []
        
        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            
            if leftElement < rightElement {
                orderedArray.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                orderedArray.append(rightElement)
                rightIndex += 1
            } else {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIndex += 1
            }
        }
        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < right.count {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
        return orderedArray
    }
    
    // sort "Selection"
    static func sortSelection (_ array: [Int]) -> [Int] {
        var arr = array
        for barrier in (0..<arr.endIndex) {
            for index in 0..<barrier {
                if arr[barrier] < arr[index] {
                    let tmp = arr[index]
                    arr[index] = arr[barrier]
                    arr[barrier] = tmp
                }
            }
        }
        return arr
    }
    
    // sort "Quick"
    static func quickSort(array: [Int], left: Int = 0, right: Int? = nil) -> [Int] {
        let right = right ?? array.count - 1
        var arrayResult = array
        var m = left
        var k = right
        let center = ( arrayResult[(m + k) / 2] )
        var buf = 0
        repeat {
            while arrayResult[m] < center { m += 1 }
            while arrayResult[k] > center { k -= 1 }
            if m <= k {
                buf = arrayResult[m]
                arrayResult[m] = arrayResult[k]
                arrayResult[k] = buf
                m += 1
                k -= 1
            }
        } while m < k
        if left < k {
            arrayResult = quickSort( array: arrayResult, left: left,right: k )
        }
        if m < right {
            arrayResult = quickSort( array: arrayResult, left: m,right: right )
        }
        return arrayResult
    }
    
    @discardableResult
    static func sortArray(array: [Int], sortType: SortArrayEnum) -> [Int] {
        switch sortType {
        case .bubble:
            return sortBubble(array)
        case .insert:
            return sortInsert(array)
        case .selection:
            return sortSelection(array)
        case .merge:
            return sortMerge(array)
        case .quick:
            return quickSort(array: array)
        }
    }  
}
