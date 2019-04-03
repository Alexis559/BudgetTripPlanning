//
//  DepenseTableViewController.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 03/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

import Foundation
import UIKit

class DepenseTableViewController: NSObject, DepenseSetViewModelDelegate, UITableViewDataSource {
  
    var depenseTableView : UITableView
    var depensesViewModel : DepenseSetViewModel
    
    init(tableView: UITableView, voyage: Voyage) {
        self.depenseTableView = tableView
        self.depensesViewModel = DepenseSetViewModel(voyage: voyage)
        super.init()
        self.depenseTableView.dataSource = self
        self.depensesViewModel.delegate = self
    }
    
    init(tableView: UITableView, personne: Personne) {
        self.depenseTableView = tableView
        self.depensesViewModel = DepenseSetViewModel(personne: personne)
        super.init()
        self.depenseTableView.dataSource = self
        self.depensesViewModel.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func dataSetChanged() {
        self.depenseTableView.reloadData()
    }
    
    func depenseDeleted(at indexPath: IndexPath) {
        self.depenseTableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func depenseUpdated(at indexPath: IndexPath) {
        self.depenseTableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func depenseAdded(at indexPath: IndexPath) {
        self.depenseTableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.depensesViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "depenseCell", for: indexPath)
        cell.textLabel?.text = self.depensesViewModel.get(depenseAt: indexPath.row)?.titre
        return cell
    }    
}