//
//  ViewController.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/7/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sortBubbleButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let tableStoryBoard = storyboard.instantiateViewController(withIdentifier: "tableStoryBoardID") as? TableDataViewController else { return }
        tableStoryBoard.sortType = typeSort.Bubble
        self.navigationController?.pushViewController(tableStoryBoard, animated: true)
    }
    
    @IBAction func sortInsertButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let tableStoryBoard = storyboard.instantiateViewController(withIdentifier: "tableStoryBoardID") as? TableDataViewController else { return }
        tableStoryBoard.sortType = typeSort.Insert
        self.navigationController?.pushViewController(tableStoryBoard, animated: true)
    }
    
    @IBAction func sortSelectionButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let tableStoryBoard = storyboard.instantiateViewController(withIdentifier: "tableStoryBoardID") as? TableDataViewController else { return }
        tableStoryBoard.sortType = typeSort.Selection
        self.navigationController?.pushViewController(tableStoryBoard, animated: true)
    }
    
    
    @IBAction func statisticsButtonTapped(_ sender: UIButton) {
        
    }
   
    
}

enum typeSort: Int {
    case Quick = 0
    case Merge
    case Bubble
    case Insert
    case Selection
    
    
    
    
    var title: (String) {
        switch self {
        case .Bubble:
            return ("Sort Bubble")
        case .Insert:
            return ("Sort Insert")
        case .Selection:
            return ("Sort Selection")
        case .Merge:
            return ("Sort Merge")
        case .Quick:
            return ("Sort Quick")
        }
    }
}




