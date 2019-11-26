//
//  CustomTextField.swift
//  school
//
//  Created by Анатолий Оруджев on 26.11.2019.
//  Copyright © 2019 Head and Hands. All rights reserved.
//

import UIKit

@IBDesignable class CustomTextField: UITextField {
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = .clear{
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderRadius: CGFloat = 0.0 {
           didSet {
               self.layer.cornerRadius = borderRadius
           }
       }
}
