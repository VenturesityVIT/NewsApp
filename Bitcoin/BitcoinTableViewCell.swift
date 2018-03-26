//
//  BitcoinTableViewCell.swift
//  newsApp
//
//  Created by Adarsh Sinha on 26/03/18.
//  Copyright © 2018 Adarsh Sinha. All rights reserved.
//

import UIKit

class BitcoinTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
