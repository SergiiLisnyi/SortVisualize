//
//  TypeArrayModelProtocol.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/11/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import Foundation

protocol TypeArrayModelProtocol {
    var dictionary: [Int: [Int]] { get set }
    var name: String { get }
    var count: Int { get }
    var type: TypeArrayEnum { get }
}



