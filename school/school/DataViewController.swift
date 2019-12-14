//
//  DataViewController.swift
//  school
//
//  Created by Анатолий Оруджев on 11.12.2019.
//  Copyright © 2019 Head and Hands. All rights reserved.
//

import UIKit
import Alamofire

class DataViewController: UIViewController {
    
    @IBOutlet weak var viewDataTable : UITableView!
    

    var objectResponse:ObjectResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewDataTable.delegate = self
        self.viewDataTable.dataSource = self
  
        getData("https://gdemost.handh.ru/api/v1/bridges/?format=json")
        
    }
    
    // MARK: - Get Data Json
    
    
    private func getData(_ url: String) {
        guard let urlData = URL(string: url) else {
            fatalError("Not found url")
        }
        
        let reguestData = AF.request(urlData)
       
        reguestData.responseDecodable{(result:DataResponse<ObjectResponse, AFError>) in
            
        
            guard let resultSucs = result.value else {return}
                
            self.objectResponse = resultSucs
            self.viewDataTable.reloadData()
    

            }
        
    }

}

extension DataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectResponse?.objects.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt IndexPath: IndexPath) -> UITableViewCell {
        
        guard let cellData = tableView.dequeueReusableCell(withIdentifier: "CellData") as? DataTableViewCell else {
            fatalError("Not found cell")
        }
        
        let eachObj = objectResponse.objects[IndexPath.row]
        cellData.labelTableCell.text = eachObj.name
        
        
        DispatchQueue.global(qos: .utility).async {
            
            if let urlImg = URL(string: "https://gdemost.handh.ru/\(eachObj.photoOpen)") {
                
                if let data = try? Data(contentsOf: urlImg) {
                    
                        DispatchQueue.main.async {
                            cellData.imgTableCell.image = UIImage(data: data)
                    }
                           
                }
                       
           }
            
        }
        
        return cellData
        
    }
    

}

extension DataViewController: UITableViewDelegate {

}
