//
//  SearchViewController.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 17/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var viewRestaurantButton: UIButton!
    
    var viewModel:SearchViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.viewModel == nil {
            self.viewModel = SearchViewModel(view: self)
        }
        
        self.viewModel?.performInitialViewSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onViewListings(_ sender: Any) {
        self.viewModel?.onViewListings()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            let destination = segue.destination as? RestaurantTableViewController,
            let viewModel = self.viewModel else {
                return
        }
        
        if identifier.compare("presentSearchResults") != .orderedSame {
            return
        }
        
        let detailViewModel = viewModel.viewModelForSelectedArea()
        detailViewModel?.view = destination as RestaurantTableViewControllerProtocol
        destination.viewModel = detailViewModel
    }
 
}

extension SearchViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        guard let viewModel = self.viewModel else {
            return nil
        }
        
        return viewModel.titleForRow(row, component:component)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let viewModel = self.viewModel else {
            return
        }
        
        return viewModel.didSelectRow(row, component:component)
    }
}

extension SearchViewController : UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        guard let viewModel = self.viewModel else {
            return 0
        }
        
        return viewModel.numberOfComponents()
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        guard let viewModel = self.viewModel else {
            return 0
        }
        
        return viewModel.numberOfRowsInComponent(component)
    }
    
}


extension SearchViewController : SearchViewControllerProtocol {
    func setNavigationTitle(_ title:String) {
            self.title = title
    }
    
    func enableRestaurantListingsButton(_ state:Bool) {
        self.viewRestaurantButton.isEnabled = state
    }
    
    func displayResultsScreen() {
        self.performSegue(withIdentifier: "presentSearchResults", sender: self)
    }
}
