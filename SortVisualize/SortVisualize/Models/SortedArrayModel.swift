//
//  SortedArrayModel.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/11/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

class SortedArrayModel: TypeArrayModelProtocol {
    
    var name: String = TypeArrayEnum.sorted.title
    var dictionary: [Int: [Int]]

    init() {
        let data1k = Array<Int>.createArray(count: 1000)
        let data2k = Array<Int>.createArray(count: 2000)
        let data4k = Array<Int>.createArray(count: 4000)
        let data8k = Array<Int>.createArray(count: 8000)
        let data16k = Array<Int>.createArray(count: 1000) //16K
        dictionary = [1000 : data1k.sorted(),
                      2000: data2k.sorted(),
                      4000 : data4k.sorted(),
                      8000: data8k.sorted(),
                      16000 : data16k.sorted()]
    }
    
    var count: Int {
        get {
            return dictionary.count
        }
    }
}

