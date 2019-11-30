//
//  RegistrationViewController.swift
//  school
//
//  Created by Анатолий Оруджев on 27.11.2019.
//  Copyright © 2019 Head and Hands. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var registrationLabelTitle: UILabel!
    @IBOutlet weak var ViewRegistration: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardDisplay(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardDisplay(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
   
    @objc func keyboardDisplay(notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        
        
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height

    // MARK: - Animation
        
        guard let animationKeyboard = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber else {
            return
        }
        
        UIView.animate(withDuration: TimeInterval(truncating: animationKeyboard)) {
//            print("it is self - \(self)")
            self.scrollView.contentInset.bottom = keyboardHeight
            self.scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
        }
    }
    
    // MARK: - Task Two: Scale Label
  
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollY = scrollView.contentOffset.y
        let value = min(-scrollY, 100) / 20 // have to fix!!!
        print("Value - \(value)")
        
        if (value >= 1 ) {
            registrationLabelTitle.transform = CGAffineTransform(scaleX: CGFloat(value) , y: CGFloat(value))
        } else {
             registrationLabelTitle.transform = CGAffineTransform(scaleX: 1 , y: 1)
        }
    }
}
