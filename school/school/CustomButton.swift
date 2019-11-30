//
//  CustomButton.swift
//  school
//
//  Created by Анатолий Оруджев on 26.11.2019.
//  Copyright © 2019 Head and Hands. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    @IBInspectable var highlightedColor : UIColor?
    
    private var baseBackgroundColor: UIColor?

    override var isHighlighted: Bool {
        
         didSet {
            backgroundColor = isHighlighted ? highlightedColor : baseBackgroundColor // baseBackgroundColor
         }
    }
    override func awakeFromNib() {
        super.awakeFromNib()

        baseBackgroundColor = backgroundColor
    }
    
}
