//
//  ProductList.swift
//  AlamoFireExample
//
//  Created by Yogesh Rathore on 01/03/19.
//  Copyright © 2019 Yogesh Rathore. All rights reserved.
//

import Foundation

struct ProductList: Codable {
    
    let code : String?
    let description : String?
    let id : Int?
    let imageUrl : String?
    let name : String?
    let price : Float?
    let releaseDate : String?
    let starRating : Float?
    
}

//struct ProductArray: Codable {
//    let code, description, imageUrl, name, price, releaseDate, starRating: String?
//    let id: Int?
//}



