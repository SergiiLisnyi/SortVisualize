//
//  TableDataViewController.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/7/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class TableDataViewController: UIViewController {

    var array: [Int] = []
    var model = Model()
    
   weak var dataController: TableController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // print (array)
        
        array = model.createArray()
    }

 
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
       
        let result = model.sortBubble()
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? TableController else { return }
        dataController = controller
    }
    

}


