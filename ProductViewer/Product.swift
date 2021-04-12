//
//  Product.swift
//  ProductViewer
//
//  Created by Royce Reynolds on 4/7/21.
//  Copyright © 2021 Target. All rights reserved.
//

import Foundation

struct Products:Decodable{
    var products: [Product]
}
    

struct Product: Decodable{
    var id: Int
    var title: String
    var aisle: String
    var description: String
    var image_url: URL
    var regular_price:Price
    var sale_price:Price?
    
}

struct Price: Decodable{
    var amount_in_cents:Int
    var currency_symbol:String
    var display_string:String
}
