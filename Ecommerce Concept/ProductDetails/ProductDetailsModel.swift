//
//  ProductDetailsModel.swift
//  Ecommerce Concept
//
//  Created by Гарик on 07.12.2022.
//

import Foundation


struct ProductDetailsModel: Decodable {
    var CPU: String
    var camera: String
    var capacity: [String]
    var color: [String]
    var id: String
    var images: [String]
    var isFavorites: Bool
    var price: Int
    var rating: Double
    var sd: String
    var ssd: String
    var title: String
}
