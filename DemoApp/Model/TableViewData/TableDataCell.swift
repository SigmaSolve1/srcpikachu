//
//  TableDataCell.swift
//  DemoApp
//
//  Created by Deval on 03/08/17.
//  Copyright © 2017 Prudent. All rights reserved.
//

import UIKit

class TableDataCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblcity: UILabel!
    @IBOutlet weak var lblcountry: UILabel!
     @IBOutlet weak var ImageFav: UIImageView!
 
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
