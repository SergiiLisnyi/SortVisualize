//
//  ViewController.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/7/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var array: [Int] = []
    @IBOutlet weak var createArrayButton: UIButton!
    @IBOutlet weak var arrayLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func createArrayButtonTapped(_ sender: Any) {
        
        var tmpArray: [Int] = []
        for _ in 0..<10 {
            tmpArray.append(Int(arc4random_uniform(UInt32(10))))
        }
        array = tmpArray
        arrayLabel.text = array.description
    
    }
    
    
    
    @IBAction func sortButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let tableStoryBoard = storyboard.instantiateViewController(withIdentifier: "tableStoryBoardID") as? TableDataViewController else { return }
        tableStoryBoard.array = array
        self.navigationController?.pushViewController(tableStoryBoard, animated: true)
    }
    
    
}

