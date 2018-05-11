//
//  StatisticsDataViewController.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/10/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class StatisticsDataViewController: UIViewController {

    
    
    @IBOutlet weak var countElementLabel: UILabel!
    @IBOutlet weak var dataTable: UITableView!

    let timeSort = TimeSortModel()
  
    var arrayResult: Array<Array<String>> = [[],[]]

   // var typeSortArr: [typeSort] = [.Quick, .Merge, .Bubble, .Insert, .Selection]
    
    
    let typeSortArrayWithNS: [typeSort] = [.Quick, .Merge]
    let typeSortArrayWithGCD: [typeSort] = [.Bubble, .Insert, .Selection]
    
    
    let arrayTypeInput = ["simple", "sorted", "sorted-"]
    
    let background = DispatchQueue.global()
    let main = DispatchQueue.main
    
    let operationQueue = OperationQueue()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayResult = Array(repeating: Array(repeating: "", count: 5), count: 5)
        
        background.async {
            self.doSyncWorkWithGSD()
        }
        
        operationQueue.addOperation {
            self.doSyncWorkWithNSOperation()
            
        }
        
    }
    
    func doSyncWorkWithNSOperation() {
        var count = 0
        for sortType in typeSortArrayWithNS {
            arrayResult[count] = self.timeSort.timeSort(sortType: sortType, typeArray: .simple)
            count += 1
            self.main.sync {
                self.dataTable.reloadData()
            }
        }
    }
    
    func doSyncWorkWithGSD() {
        var count = 2
        for sortType in typeSortArrayWithGCD {
            arrayResult[count] = self.timeSort.timeSort(sortType: sortType, typeArray: .simple)
            count += 1
            self.main.sync {
                self.dataTable.reloadData()
            }
        }
    }
    
   
    
    
    
    
 
    @IBAction func incrementButtonTapped(_ sender: UIButton) {
        print("->")
//        typeInput = "sorted"
//        print(typeInput)
//        countElementLabel.text = String(typeInput)
        
    }
    
    
    @IBAction func decrementButtonTapped(_ sender: UIButton) {
        print("<-")
//        typeInput = "sorted-"
//        print(typeInput)
//        countElementLabel.text = String(typeInput)
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 20))
        view.backgroundColor = .yellow
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width, height: 20))
        label.text = typeSort(rawValue: section)?.title
        label.textAlignment = .center
        view.addSubview(label)
        return view
    }
    
    
    
}
