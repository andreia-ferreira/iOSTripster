//
//  PlacesViewController.swift
//  Tripster
//
//  Created by Andreia on 11/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import UIKit

class PlacesViewController: UIViewController, UITableViewDataSource {
    
    lazy var viewModel : PlacesViewModel = {
        return PlacesViewModel()
    }()
    lazy var mainView : PlacesView = {
        return self.view.viewWithTag(1) as! PlacesView
    }()
    private var listPlaces: [PlacesResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPlaces()
        
        initObservers()
    }
    
    private func initObservers() {
        viewModel.listPlacesClosure = {[weak self] (value) in
            DispatchQueue.main.async {
                if let _self = self {
                    _self.listPlaces = value
                    _self.mainView.placesTableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = listPlaces[indexPath.row].name ?? "Unknown"
        return cell
    }
    
}
