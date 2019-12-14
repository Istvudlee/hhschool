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
    @IBOutlet weak var buttonEnter: UIButton!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var RegView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var keyboardHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardDisplay(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardDisplay(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
       
    stackView.arrangedSubviews
    .compactMap { $0 as? UITextField }
    .forEach {
        $0.addTarget(self, action: #selector(beginEditing(sender:)), for: .editingDidEnd)
        $0.addTarget(self, action: #selector(endEditingExit(sender:)), for: .editingDidEndOnExit)
        }
    
    }

   // MARK: - Animation
    
    @objc func keyboardDisplay(notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height

        
        guard let animationKeyboard = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber else {
            return
        }
        
        UIView.animate(withDuration: TimeInterval(truncating: animationKeyboard)) {
            
            self.scrollView.contentInset.bottom = keyboardHeight
            self.scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
        }
    }
    

    @IBAction func tapRegistration(sender: UITapGestureRecognizer) {
            switch  sender.state {
            case .ended:
                  view.endEditing(true)
            default:
                 print("Other")
            }
            
        }
    
    @IBAction func beginEditing(sender: UITextField) {
        let visibleArea = scrollView.frame.height - keyboardHeight
        

        let centerY = visibleArea / 2.0
        
        let convertedFrame = view.convert(sender.frame, from: sender.superview)
        
        let diff = convertedFrame.midY - centerY
        
        let minContentOffset: CGFloat = -scrollView.adjustedContentInset.top
        
        let maxContentOffset: CGFloat = (scrollView.contentSize.height + scrollView.adjustedContentInset.bottom + keyboardHeight) - scrollView.frame.height - centerY

        let newContentOffsetY = min(max(scrollView.contentOffset.y + diff, minContentOffset), maxContentOffset)
        
        UIView.animate(
                withDuration: 0.3,
                delay: 0,
                options: [.curveLinear, .beginFromCurrentState],
                animations: {
                    self.scrollView.contentOffset.y = newContentOffsetY
                },
                completion: nil
            )
       }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.contentOffset.y <= 0 else {
            return
        }

        let scale = 1 + (max(min(-scrollView.contentOffset.y / scrollView.frame.height, 1), 0)) * 2

        labelTitle.transform = CGAffineTransform(scaleX: scale, y: scale)
            .translatedBy(x: 30 * scale, y: 0)
    }
    
    @IBAction func endEditingExit(sender: UITextField) {
//        print(sender.responds(to: UITextField?))
    }
}

