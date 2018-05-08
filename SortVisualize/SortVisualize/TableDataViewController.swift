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
    @IBOutlet weak var nextStepButton: UIButton!
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
        UIView.animate(withDuration: 1.0) {
            self.light(indexStart: result.at, indexFinish: result.to, color: .lightGray)
        }
    
        dataTable.moveRow(at: startIndex, to: finishIndex)
        dataTable.moveRow(at: finishIndex, to: startIndex)
        
        UIView.animate(withDuration: 1.0) {
            self.light(indexStart: result.at, indexFinish: result.to, color: .clear)
        }
        dataTable.endUpdates()
        
        nextStepButton.isEnabled = !(result == (at: 0, to: 0))
    }
    
    func light(indexStart: Int, indexFinish: Int, color: UIColor) {
        let cellStart = dataTable.cellForRow(at: IndexPath(row: indexStart, section: 0)) as? TableDataViewCell
        cellStart?.backgroundColor = color
        let cellFinish = dataTable.cellForRow(at: IndexPath(row: indexFinish, section: 0)) as? TableDataViewCell
        cellFinish?.backgroundColor = color
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




