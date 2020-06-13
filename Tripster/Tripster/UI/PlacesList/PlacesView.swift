//
//  PlacesView.swift
//  Tripster
//
//  Created by Andreia on 11/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import UIKit

class PlacesView: UIView {
    @IBOutlet weak var greetingsView: UIView!
    @IBOutlet weak var placesTableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    
    func registerTableViewCells() {
        let bundle = Bundle(identifier: BUNDLE_IDENTIFIER)
        let cell = UINib(nibName: "SpotlightTableViewCell", bundle: bundle)
        self.placesTableView.register(cell, forCellReuseIdentifier: "SpotlightTableViewCell")
        placesTableView.rowHeight = UITableView.automaticDimension
    }
    
    func showErrorMessage(errorMessage: String) {
        errorLabel.text = errorMessage
        errorView.isHidden = false
        placesTableView.isHidden = true
        greetingsView.isHidden = true
    }
    
    func showLoading() {
        greetingsView.isHidden = true
        loadingIndicator.isHidden = false
    }
    
    func hideLoading() {
        greetingsView.isHidden = false
        loadingIndicator.isHidden = true
    }
    
}

