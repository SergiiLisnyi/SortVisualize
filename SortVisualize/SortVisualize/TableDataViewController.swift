//
//  TableDataViewController.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/7/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class TableDataViewController: UIViewController {

   
    var model = Model()
    var sortType: SortType!
    
    @IBOutlet weak var dataTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = sortType.title
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
       
        let result = model.sort(type: sortType)
        let startIndex = IndexPath(item: result.at, section: 0)
        let finishIndex = IndexPath(item: result.to, section: 0)
        
        dataTable.beginUpdates()
        dataTable.moveRow(at: startIndex, to: finishIndex)
        dataTable.moveRow(at: finishIndex, to: startIndex)
        dataTable.endUpdates()
        
    }
}

extension TableDataViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableDataViewCell.identifier, for: indexPath) as? TableDataViewCell else  {
            return UITableViewCell()
        }
        cell.configureWith(text: String(model.getElement(byIndex: indexPath.row)))
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}




