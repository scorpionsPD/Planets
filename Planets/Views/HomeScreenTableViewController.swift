//
//  HomeScreenTableViewController.swift
//  Planets
//
//  Created by Pradeep Dahiya on 18/04/23.
//

import UIKit

class HomeScreenTableViewController: UITableViewController {
let vm = HomeScreenVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.getHomeScreenData() // fetching list of planets
        vm.reloadList = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension HomeScreenTableViewController {
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vm.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifire.homeCellIdentifire, for: indexPath) as! HomeTableViewCell
        cell.cellData = vm.modelAt(indexPath.row)
        return cell
    }
}
