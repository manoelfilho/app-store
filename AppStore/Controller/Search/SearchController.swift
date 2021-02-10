//
//  SearchController.swift
//  AppStore
//
//  Created by Manoel Filho on 29/01/21.
//

import Foundation
import UIKit

class SearchController: UITableViewController, UISearchBarDelegate {
    
    let cellId = "cellId"
    let searchController = UISearchController(searchResultsController: nil)
    var apps: [App] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SearchCell.self, forCellReuseIdentifier: cellId)
        self.configureSearchBar()
    }
    
    //configuration for searchbar
    func configureSearchBar(){
        navigationItem.searchController = self.searchController
        
        //background do searchbar
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Apple Store"
        
        //delegate for searchbar
        self.searchController.searchBar.delegate = self
    }
    
}

// MARK: TableView Methods

extension SearchController {
    
    //numbers of cell
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apps.count
    }
    
    //cell that is returned
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SearchCell
        cell.app = self.apps[indexPath.row]
        return cell
    }
    
    //height of cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return 80% of tableView bounds
        return .init(tableView.bounds.width * 0.8)
    }
    
}

// MARK: Searchbar Delegate Methods
extension SearchController {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.returnApps(text: searchText)
    }
}

// MARK: Service Search
extension SearchController {
    
    func returnApps(text: String) {
        AppService.shared.searchApps(text: text) { (apps, err) in
            if let apps = apps {
                DispatchQueue.main.async {
                    self.apps = apps
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}
