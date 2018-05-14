//
//  StatisticsDataViewController.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/10/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class StatisticsDataViewController: UIViewController {

    
    @IBOutlet weak var changeModelButton: UIButton!
    @IBOutlet weak var barProgress: UIProgressView!
    @IBOutlet weak var typeArraysLabel: UILabel!
    @IBOutlet weak var dataTable: UITableView!

    var modelData: TypeArrayModelProtocol = SimpleArrayModel()
    var arrayResult: Array<Array<String>> = [[],[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayResult = Array(repeating: Array(repeating: "no data", count: modelData.count), count: TypeSortEnum.count)
   
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
             self.doSort(forType: [.insert, .selection, .bubble])
        }

        OperationQueue().addOperation {
            self.doSort(forType: [.quick, .merge])
        }
    }
    
    fileprivate func doSort(forType: [TypeSortEnum]) {
        let stepBarProgress = 1.0 / Float(TypeSortEnum.count)
        for i in 0..<forType.count {
            arrayResult[forType[i].rawValue] = StatisticsSortModel.timeSort(sortType: forType[i], dictionary: modelData.dictionary)
            DispatchQueue.main.sync {
                self.dataTable.reloadData()
                barProgress.progress += stepBarProgress
                barProgress.progress == 1.0 ? (changeModelButton.isEnabled = true) : (changeModelButton.isEnabled = false)
            }
        }
    }
    
    fileprivate func changeModel(modelDataType: TypeArrayEnum) -> TypeArrayModelProtocol {
        switch modelDataType {
        case .simple:
            return SortedArrayModel()
        case .sorted:
            return ReverseArrayModel()
        case .reverse:
            return SimpleArrayModel()
        }
    }

    @IBAction func changeModelButtonTapped(_ sender: UIButton) {
        barProgress.progress = 0
        self.viewDidLoad()
        modelData = changeModel(modelDataType: modelData.type)
        typeArraysLabel.text = modelData.name
    }
}

extension StatisticsDataViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableDataViewCell.identifier, for: indexPath) as? TableDataViewCell else  {
            return UITableViewCell()
        }
        cell.configureWith(text: arrayResult[indexPath.section][indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TypeSortEnum.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 20))
        view.backgroundColor = .yellow
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 20))
        label.text = TypeSortEnum(rawValue: section)?.title
        label.textAlignment = .center
        view.addSubview(label)
        return view
    }
}
