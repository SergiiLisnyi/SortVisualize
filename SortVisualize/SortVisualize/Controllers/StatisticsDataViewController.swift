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
    var countFillTable = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetTableView()
        doSortWithOtherThread()
    }
    
    fileprivate func resetTableView() {
        barProgress.progress = 0
        countFillTable = 0
        arrayResult = Array(repeating: Array(repeating: "no data", count: modelData.count), count: SortArrayEnum.count)
    }
    
    fileprivate func doSortWithOtherThread() {
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            self.makeSort(for: [.insert, .selection, .bubble])
        }
        OperationQueue().addOperation {
            self.makeSort(for: [.quick, .merge])
        }
    }
    
    fileprivate func makeSort(for types: [SortArrayEnum]) {
        let stepBarProgress = 1.0 / Float(SortArrayEnum.count)
        for i in 0..<types.count {
            arrayResult[types[i].rawValue] = StatisticsSortModel.timeSort(sortType: types[i], dictionary: modelData.dictionaryData)
            DispatchQueue.main.sync {
                self.dataTable.reloadData()
                barProgress.progress += stepBarProgress
                changeModelButton.isEnabled = countFillTable == modelData.count - 1
            }
            countFillTable += 1
        }
    }
    
    @IBAction func changeModelButtonTapped(_ sender: UIButton) {
        resetTableView()
        doSortWithOtherThread()
        modelData = modelData.type.otherModel
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
        return SortArrayEnum.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 20))
        view.backgroundColor = .yellow
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 20))
        label.text = SortArrayEnum(rawValue: section)?.title
        label.textAlignment = .center
        view.addSubview(label)
        return view
    }
}
