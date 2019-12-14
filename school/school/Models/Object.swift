//
//  Object.swift
//  school
//
//  Created by Анатолий Оруджев on 10.12.2019.
//  Copyright © 2019 Head and Hands. All rights reserved.
//

import  UIKit

struct ObjectResponse: Decodable {
    let objects: [Object]
}

struct Object: Decodable {
    
    let id: Int
    let lat: Double
    let lng: Double
    let name: String
    let nameEng: String
    let photoClose: String
    let photoOpen: String
    let `public`: Bool
    let resource_uri: String
    
}

extension Object {
    enum CodingKeys: String, CodingKey {
        case id
        case lat
        case lng
        case name
        case nameEng = "name_eng"
        case photoClose = "photo_close"
        case photoOpen = "photo_open"
        case `public`
        case resource_uri
        
    }
}


//            "id": 2,
//            "lat": 59.925602,
//            "lng": 30.395119,
//            "name": "Мост Александра Невского",
//            "name_eng": "Alexander Nevsky Bridge",
//            "photo_close": "photos/Alexandra_Nevskogo_open.png",
//            "photo_open": "photos/Alexandra_Nevskogo_closed.png",
//            "public": true,
//            "resource_uri": "/api/v1/bridges/2/"
