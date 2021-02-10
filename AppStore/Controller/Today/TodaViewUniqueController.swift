//
//  TodaViewUniqueController.swift
//  AppStore
//
//  Created by Manoel Filho on 06/02/21.
//

import UIKit

class TodaViewUniqueController: UITableViewController {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super .viewDidLoad()
        tableView.backgroundColor = .white
        tableView.register(TodayUniqueCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        self.addHeader()
    }
    
    func addHeader(){
        let headerView = UIView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width + 480))
        
        let todayViewCell = TodayCell()
        todayViewCell.layer.cornerRadius = 0
        
        headerView.addSubview(todayViewCell)
        todayViewCell.preencherSuperview()
        
        self.tableView.tableHeaderView = headerView
    }
    
}

extension TodaViewUniqueController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! TodayUniqueCell
        return cell
    }
}
