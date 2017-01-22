//
//  RestaurantTableViewController.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 17/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var viewModel: RestaurantTableViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.performInitialViewSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = self.viewModel else {
            return 0
        }
        
        return viewModel.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = self.viewModel else {
            return 0
        }
        
        return viewModel.numberOfRowsInSection(section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCellIdentifier", for: indexPath) as? RestaurantTableViewCell
        
        guard let viewModel = viewModel,
            let restaurantTableViewCell = cell else {
                return UITableViewCell()
        }
        
        let detailViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        detailViewModel?.view = restaurantTableViewCell
        
        restaurantTableViewCell.viewModel = detailViewModel
        restaurantTableViewCell.setup()
        
        return restaurantTableViewCell
    }
    
}


extension RestaurantTableViewController : RestaurantTableViewControllerProtocol {
    func setNavigationTitle(_ title:String) {
        self.title = title
    }
}

