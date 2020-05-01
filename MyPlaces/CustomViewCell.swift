//
//  CustomViewCell.swift
//  MyPlaces
//
//  Created by Лёпа on 01.05.2020.
//  Copyright © 2020 Lepa. All rights reserved.
//

import UIKit

class CustomViewCell: UITableViewCell {
    
    @IBOutlet weak var imageOfPlace: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
