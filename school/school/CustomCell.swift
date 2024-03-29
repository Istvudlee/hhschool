//
//  CustomCell.swift
//  school
//
//  Created by Анатолий Оруджев on 02.12.2019.
//  Copyright © 2019 Head and Hands. All rights reserved.
//


import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
     let maxWidth =  labelTitle.frame.maxX - imageViewCell.frame.width - 8 - labelTitle.frame.minX
        
        labelTitle.preferredMaxLayoutWidth = maxWidth
    }
    
     
}
