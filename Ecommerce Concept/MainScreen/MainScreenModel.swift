//
//  HotSalesModel.swift
//  Ecommerce Concept
//
//  Created by Гарик on 02.12.2022.
//

import Foundation


struct MainScreenModel: Codable {
    let home_store: [HotSalesItems]
    let best_seller: [BestSellerItems]
}

struct HotSalesItems: Codable {
    let id: Int?
    let is_new: Bool?
    let title: String?
    let subtitle: String?
    let picture: String?
    let is_buy: Bool
}

struct BestSellerItems: Codable {
    let id: Int?
    let is_favorites: Bool?
    let title: String?
    let price_without_discount: Int
    let discount_price: Int
    let picture: String?
}
