//
//  ViewController.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/7/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sortBubbleButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let tableStoryBoard = storyboard.instantiateViewController(withIdentifier: "tableStoryBoardID") as? TableDataViewController else { return }
        tableStoryBoard.sortType = TypeSortEnum.bubble
        self.navigationController?.pushViewController(tableStoryBoard, animated: true)
    }
    
    @IBAction func sortInsertButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let tableStoryBoard = storyboard.instantiateViewController(withIdentifier: "tableStoryBoardID") as? TableDataViewController else { return }
        tableStoryBoard.sortType = TypeSortEnum.insert
        self.navigationController?.pushViewController(tableStoryBoard, animated: true)
    }
    
    @IBAction func sortSelectionButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let tableStoryBoard = storyboard.instantiateViewController(withIdentifier: "tableStoryBoardID") as? TableDataViewController else { return }
        tableStoryBoard.sortType = TypeSortEnum.selection
        self.navigationController?.pushViewController(tableStoryBoard, animated: true)
    }
    
    
    @IBAction func statisticsButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let statisticsStoryBoard = storyboard.instantiateViewController(withIdentifier: "statisticsStoryBoardID") as? StatisticsDataViewController else { return }
        self.navigationController?.pushViewController(statisticsStoryBoard, animated: true)
    }
}





