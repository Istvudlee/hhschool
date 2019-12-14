//
//  DataTableViewCell.swift
//  school
//
//  Created by Анатолий Оруджев on 11.12.2019.
//  Copyright © 2019 Head and Hands. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var imgTableCell : UIImageView!
    @IBOutlet weak var labelTableCell : UILabel!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
