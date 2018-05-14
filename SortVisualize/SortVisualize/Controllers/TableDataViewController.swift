//
//  TableDataViewController.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/7/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class TableDataViewController: UIViewController {

    let sizeModel = 10
    let rangeModel = 1000
    
    lazy var model = ArrayModel(size: sizeModel, range: rangeModel)
    
    var sortType: TypeSortEnum!
    @IBOutlet weak var nextStepButton: UIButton!
    @IBOutlet weak var dataTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = sortType.title
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let sortResult = model.sort(type: sortType)
        let startIndex = IndexPath(item: sortResult.at, section: 0)
        let finishIndex = IndexPath(item: sortResult.to, section: 0)
        
        dataTable.beginUpdates()
        UIView.animate(withDuration: 1.0) {
            self.light(indexStart: sortResult.at, indexFinish: sortResult.to, color: .lightGray)
        }
    
        dataTable.moveRow(at: startIndex, to: finishIndex)
        dataTable.moveRow(at: finishIndex, to: startIndex)
        
        UIView.animate(withDuration: 1.0) {
            self.light(indexStart: sortResult.at, indexFinish: sortResult.to, color: .clear)
        }
        dataTable.endUpdates()
        
        if sortResult == (at: 0, to: 0) {
            nextStepButton.setTitle("Sort finished", for: .normal)
            callAlert()
        }
    }
   
    fileprivate func light(indexStart: Int, indexFinish: Int, color: UIColor) {
        let cellStart = dataTable.cellForRow(at: IndexPath(row: indexStart, section: 0)) as? TableDataViewCell
        cellStart?.backgroundColor = color
        let cellFinish = dataTable.cellForRow(at: IndexPath(row: indexFinish, section: 0)) as? TableDataViewCell
        cellFinish?.backgroundColor = color
    }
}

extension TableDataViewController {
    func callAlert() {
        let alertController = UIAlertController(title: "Sort finished", message: "Restart sort?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cansel", style: .cancel) { (action) in })
        alertController.addAction(UIAlertAction(title: "Ok", style: .default) { (action) in
            self.model = ArrayModel(size: self.sizeModel, range: self.rangeModel)
            self.dataTable.reloadData()
            self.nextStepButton.setTitle("Next", for: .normal)
        })
        self.present(alertController, animated: true, completion: nil)
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






