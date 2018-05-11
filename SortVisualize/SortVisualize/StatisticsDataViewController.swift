//
//  StatisticsDataViewController.swift
//  SortVisualize
//
//  Created by Sergii Lisnyi on 5/10/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit

class StatisticsDataViewController: UIViewController {

    
    @IBOutlet weak var barProgress: UIProgressView!
    
    @IBOutlet weak var countElementLabel: UILabel!
    @IBOutlet weak var dataTable: UITableView!

    let timeSort = TimeSortModel()
    var timer = Timer()
  
    var arrayResult: Array<Array<String>> = [[],[]]
    let countSize = 5
    
    var progress = 0.0
    
    let typeSortArrayWithNS: [typeSort] = [.Quick, .Merge]
    let typeSortArrayWithGCD: [typeSort] = [.Bubble, .Insert, .Selection]
    
    let arrayTypeInput = ["simple", "sorted", "sorted-"]
    
    let background = DispatchQueue.global()
    let main = DispatchQueue.main
    
    let operationQueue = OperationQueue()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayResult = Array(repeating: Array(repeating: "", count: countSize), count: countSize)
        
        //createTimer()
        
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
                barProgress.progress += 0.2
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
                barProgress.progress += 0.2
                
            }
        }
    }
    
//    //MARK: - Timer
//    func createTimer() {
//        timer = Timer.scheduledTimer(timeInterval: 1,
//                                      target: self,
//                                      selector: #selector(updateProgressView),
//                                      userInfo: nil,
//                                      repeats: true)
//    }
    // MARK: - UI
//    @objc func updateProgressView() {
//        if barProgress.progress != 1.0 {
//            barProgress.progress += Float(progress)
//        }
//    }
    
    
    
    
    
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
        return countSize
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countSize
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 20))
        view.backgroundColor = .yellow
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 20))
        label.text = typeSort(rawValue: section)?.title
        label.textAlignment = .center
        view.addSubview(label)
        return view
    }
 
}
