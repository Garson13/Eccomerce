//
//  MyCartModel.swift
//  Ecommerce Concept
//
//  Created by Гарик on 10.12.2022.
//

import Foundation


struct MyCartModel: Decodable {
    var basket: [Basket]
    var delivery: String
    var id: String
    var total: Int
}

struct Basket: Decodable {
    var id: Int
    var images: String
    var price: Int
    var title: String
}
