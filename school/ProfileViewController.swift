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
    
    var arrayTitle = ["Настройки", "Условия доставки", "Рестораны", "Связаться с нами", "Оценить приложение","О приложении"]
    
    var arrayImage: [UIImage] = [UIImage(imageLiteralResourceName: "imageGroup1.png"),UIImage(imageLiteralResourceName: "imageGroup2.png"),UIImage(imageLiteralResourceName: "imageGroup3.png"),UIImage(imageLiteralResourceName: "imageGroup4.png"),UIImage(imageLiteralResourceName: "imageGroup5.png"),UIImage(imageLiteralResourceName: "imageGroup6.png")]
    

   
    override func viewDidLoad() {
       super.viewDidLoad()
       self.viewTable.dataSource = self
       self.viewTable.delegate = self
       
        
//        headerTableView?.translatesAutoresizingMaskIntoConstraints = false
//
//              headerTableView?.bottomAnchor.constraint(equalTo: view.Tablevi, constant: 1).isActive = true
//        NSLayoutConstraint.activate([
//            (headerTableView?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 60))!
//        ])
        
    }
}
// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {

 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrayTitle.count
 }

 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as? CustomCell else {
         fatalError("Not found cell")
     }
    cell.addImageAndTitle(image: arrayImage[indexPath.row], labelText: arrayTitle[indexPath.row])
    
   
//    let tableHeight = viewTable.bounds.height
//    let headerCell = headerTableView.bounds.height
    

     return cell
  }
    
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerSection = headerTableView
      
        return headerSection
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "goToAuthoriz", sender: self)
//    }
    
}


