//
//  RestaurantTableViewCell.swift
//  RestaurantDirectory
//
//  Created by Abhishek Mishra on 17/01/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var cuisine: UILabel!
    
    var viewModel:RestaurantTableViewCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup() {
        viewModel?.setup()
    }

}

extension RestaurantTableViewCell : RestaurantTableViewCellProtocol {
    
    func setRestaurantLocation(_ location:String) {
        self.location.text = location
    }
    
    func setRestaurantRating(_ rating:String) {
        self.rating.text = rating
    }
    
    func setRestaurantCuisine(_ cuisine:String) {
        self.cuisine.text = cuisine
    }
    
    func setRestarantDistance(_ distance:String) {
        self.distance.text = distance
    }
    
    func setRestaurantName(_ restaurantName:String) {
        self.name.text = restaurantName
    }
}
