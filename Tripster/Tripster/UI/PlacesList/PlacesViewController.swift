//
//  PlacesViewController.swift
//  Tripster
//
//  Created by Andreia on 11/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import UIKit

class PlacesViewController: UIViewController {
    
    lazy var viewModel : PlacesViewModel = {
        return PlacesViewModel()
    }()
    lazy var mainView : PlacesView = {
        return self.view.viewWithTag(1) as! PlacesView
    }()
    private var listPlaces: [PlaceOfInterest] = []
    private var spotlightPlaces: [PlaceOfInterest] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.setupLayout()
        viewModel.getPlaces()
        
        initObservers()
    }
    
    override func viewDidLayoutSubviews() {
        mainView.placesTableView.dataSource = self
    }
    
    private func initObservers() {
        viewModel.listPlacesClosure = {[weak self] (value) in
            DispatchQueue.main.async {
                if let _self = self {
                    _self.listPlaces = Array(value[3...])
                    _self.spotlightPlaces = Array(value[0...3])
                    _self.mainView.placesTableView.reloadData()
                    _self.mainView.errorView.isHidden = true
                }
            }
        }
        
        viewModel.errorClosure = {[weak self] (value) in
            DispatchQueue.main.async {
                if let _self = self {
                    _self.mainView.showErrorMessage(errorMessage: value)
                }
            }
        }
        
        viewModel.loadingClosure = {[weak self] (value) in
            DispatchQueue.main.async {
                if let _self = self {
                    if value {
                        _self.mainView.showLoading()
                    } else {
                        _self.mainView.hideLoading()
                    }
                }
            }
        }
        
    }
}

extension PlacesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpotlightTableViewCell", for: indexPath) as! SpotlightTableViewCell
            cell.spotlightItems = spotlightPlaces
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath) as! PlaceTableViewCell
            cell.setPlace(place: listPlaces[indexPath.row])
            return cell
        }
    }
}
