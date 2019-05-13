//
//  detailedTableViewCell.swift
//  Restaurants
//
//  Created by Admin on 2/6/19.
//  Copyright © 2019 Mahmoudali. All rights reserved.
//

import UIKit

class detailedTableViewCell: UITableViewCell {

    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var field: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
