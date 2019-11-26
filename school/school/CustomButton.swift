//
//  CustomButton.swift
//  school
//
//  Created by Анатолий Оруджев on 26.11.2019.
//  Copyright © 2019 Head and Hands. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    @IBInspectable var highlightedColor : UIColor = .clear {
        didSet {
            if (isHighlighted) {
                layer.backgroundColor = highlightedColor.cgColor
            }
        }
    }
    override var isHighlighted: Bool {
         didSet {
//            print(isHighlighted)
            if (isHighlighted) {
                backgroundColor = highlightedColor
            } else {
                backgroundColor = .red
            }
            
         }
    }
    
}
