//
//  ViewController.swift
//  testUISearchController
//
//  Created by user on 2021/12/06.
//

import UIKit

class ViewController: UITableViewController, UISearchResultsUpdating {

    private let items: [String] = [
            "πγγγ", "πγΏγγ", "πγΆγ©γ", "πγγγγγΌ",
            "πγγ‘γ", "πγΉγ€γ«", "πγγγ", "πγγγγγ",
            "πγͺγ", "πγ¬γ’γ³", "πγ‘γ­γ³", "πγγ",
            "π₯­γγ³γ΄γΌ", "πγγ€γγγγ«", "π₯₯γ³γ³γγγ", "π₯γ­γ¦γ€",
        ]

        private var searchController: UISearchController!
        private var resultsController: ResultsViewController!

        override func viewDidLoad() {
            super.viewDidLoad()

            definesPresentationContext = true

            resultsController = ResultsViewController()
//            searchController = UISearchController(searchResultsController: resultsController as! UIViewController)
            
            searchController.dimsBackgroundDuringPresentation = true
            searchController.hidesNavigationBarDuringPresentation = true
            searchController.searchResultsUpdater = self

            navigationItem.hidesSearchBarWhenScrolling = false
            navigationItem.searchController = searchController

            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }

        func updateSearchResults(for searchController: UISearchController) {
            if let keyword = searchController.searchBar.text, !keyword.isEmpty {
                resultsController.items = items.filter { $0.contains(keyword) }
            } else {
                resultsController.items = []
            }
        }

        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let item = items[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = item
            return cell
        }



}

