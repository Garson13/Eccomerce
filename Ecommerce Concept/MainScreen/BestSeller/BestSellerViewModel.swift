//
//  BestSellerViewModel.swift
//  Ecommerce Concept
//
//  Created by Гарик on 02.12.2022.
//

import Foundation

protocol BestSellerViewModelProtocol: AnyObject {
    var bestSellerData: Box<[BestSellerItems]> {get}
    func loadDataImage(url: String, completion: @escaping (Data?) -> Void)
}

class BestSellerViewModel: BestSellerViewModelProtocol {
    
    let url = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
    var bestSellerData: Box<[BestSellerItems]> = Box([])
    
    init() {
        loadData()
    }
    
    func loadDataImage(url: String, completion: @escaping (Data?) -> Void) {
        Service.loadImage(url: url) { data in
            completion(data)
        }
    }
    
    private func loadData() {
        Service.uploadData(url: url) { [weak self] data in
            self?.bestSellerData.value = data.best_seller
        }
    }
    
}
