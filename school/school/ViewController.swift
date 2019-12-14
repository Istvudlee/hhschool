//
//  ViewController.swift
//  school
//
//  Created by Анатолий Оруджев on 21.11.2019.
//  Copyright © 2019 Head and Hands. All rights reserved.
//

import UIKit
import Alamofire

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
        
        guard let url = URL(string: "https://gdemost.handh.ru/api/v1/bridges/?format=json") else {
            return
        }
        
        let reguest = AF.request(url)
        
        reguest.responseDecodable {(result: DataResponse<ObjectResponse, AFError>) in
            
            if let value = result.value {
//                let archivedDate = try?    NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: true)
//                do {
//                    let archivedDate = try    NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: true)
////                   let fm = FileManager.default
////                    archivedDate.write(to: <#T##URL#>)
//                } catch {
//                    print(error)
//                }
                let test = value.objects
                test.forEach { (item) in
                   print(item.photoOpen)
                   
                }
           }

        }
        
        let queue = DispatchQueue.global(qos: .background)
        queue.async {
            sleep(1)
            print("\(Thread.isMainThread) 1")
            sleep(5)
            print("\(Thread.isMainThread) 2")
            DispatchQueue.main.async {
              print("complete \(Thread.isMainThread)")
            }
        }
        
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

