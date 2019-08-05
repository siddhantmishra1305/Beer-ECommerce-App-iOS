//
//  FilterTableViewController.swift
//  BeerCraft
//
//  Created by Siddhant Mishra on 27/07/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import UIKit

class FilterTableViewController: UITableViewController {

    var filterArray = [String]()
    var selectedFilter = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.title = "Filters"
        let filterBtn = UIBarButtonItem(title: "Apply", style: UIBarButtonItem.Style.plain, target: self, action: #selector(navigateToBeerList))
        self.navigationItem.rightBarButtonItem = filterBtn
        
    }
    
    
    @objc func navigateToBeerList(){
        performSegue(withIdentifier: "BackToBeerList", sender: self)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filterArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filters", for: indexPath)

        let filterLabel :UILabel = cell.viewWithTag(1) as! UILabel
        filterLabel.text = filterArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        selectedFilter.append(filterArray[indexPath.row])
    }
    

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        if let index = selectedFilter.index(of: filterArray[indexPath.row]) {
            selectedFilter.remove(at: index)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! BeerListViewController
        controller.filterArr = selectedFilter
    }

}
