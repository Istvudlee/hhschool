//
//  ViewController.swift
//  school
//
//  Created by Анатолий Оруджев on 21.11.2019.
//  Copyright © 2019 Head and Hands. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLogin: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    weak var delegate: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
 // MARK: - User Actions
    
    @IBAction func endEditing(sender: UITextField) {
        
        if textLogin === sender {
             print("Login: \(String(describing: sender.text!))")
             textPassword.becomeFirstResponder()
           
        } else {
            print("Password: \(String(describing: sender.text!))")
            sender.resignFirstResponder()
        }
        
    }
    
    @IBAction func login(sender: UIButton) {
        
        (delegate as? ProfileViewController)?.test = true
        
        navigationController?.popToRootViewController(animated: true)
       
    }
    

    @IBAction func tap(sender: UITapGestureRecognizer) {
        
        switch  sender.state {
        case .ended:
              view.endEditing(true)
        default:
             print("Other")
        }
        
    }
}

