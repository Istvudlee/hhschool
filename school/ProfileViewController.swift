//
//  ProfileViewController.swift
//  school
//
//  Created by Анатолий Оруджев on 02.12.2019.
//  Copyright © 2019 Head and Hands. All rights reserved.
//
import UIKit
import Foundation

class ProfileViewController: UIViewController {
    @IBOutlet weak var viewTable: UITableView!
    @IBOutlet weak var imageViewHead: UIImageView!
    @IBOutlet weak var headerTableView: UIView!
    @IBOutlet weak var headerTableViewNotAuth: UIView!
    @IBOutlet weak var headerTableViewAuth: UIView!
    @IBOutlet weak var headerStackView: UIStackView!
    
    private var data = CellType.allCases
   
    var autoController = AuthViewController?.self
    
    var delegate: UIViewController?
    
    var test : Bool?

    override func viewWillAppear(_ animated: Bool) {
    
        
        if(test != nil) {
            viewTable.tableHeaderView = headerStackView
            headerTableViewNotAuth.isHidden = true
            headerStackView.frame.size.height = headerTableViewAuth.bounds.height
            headerTableViewAuth.isHidden = false
          
        }
    }
    
    
    override func viewDidLoad() {
       super.viewDidLoad()
       self.viewTable.dataSource = self
       self.viewTable.delegate = self
        
       self.viewTable.tableHeaderView = headerStackView
       headerTableViewAuth.isHidden = true
       headerStackView.frame.size.height = headerTableViewNotAuth.bounds.height
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let profile = segue.destination as? ViewController {
                profile.delegate = self
             
        }
    }
    
    // MARK: - Actions
    
    @IBAction func tapHeader(sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "goToAuth", sender: nil)
    }
    
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {

 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
 }

 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as? CustomCell else {
         fatalError("Not found cell")
     }
     
    let cellType = data[indexPath.row]
    cell.labelTitle.text = cellType.title
    cell.imageViewCell.image = cellType.image

    return cell
  }
    
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerSection = headerTableView
//
//        return headerSection
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "goToAuthoriz", sender: self)
//
//        UIApplication.shared.delegate?.window??.rootViewController
//    }
    
}

// MARk: - Перечесления(enum) картинки и заголовки меню
extension ProfileViewController {
    enum CellType : CaseIterable {
        case settings, delivery, restaurants, mail, info, estimate
        
        var image: UIImage? {
            let name: String
            
            switch self {
            case .settings:
                name = "Menu/settings"
            case .delivery:
                name = "Menu/delivery"
            case .restaurants:
                name = "Menu/restaurants"
            case .info:
                name = "Menu/info"
            case .mail:
                name = "Menu/mail"
            case .estimate:
                name = "Menu/estimate"
            
            }
            return UIImage(named: name)
        }
        
        var title: String {
            
            switch self {
            case .settings:
                return "Настройки"
            case .delivery:
                return "Условия доставки"
            case .restaurants:
                return "Рестораны"
            case .info:
                return "О приложении"
            case .mail:
                return "Связаться с нами"
            case .estimate:
               return "Оценить приложение"
                
            }
        }
    }
}

