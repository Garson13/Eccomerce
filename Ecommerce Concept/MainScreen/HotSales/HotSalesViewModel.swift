//
//  HotSalesViewModel.swift
//  Ecommerce Concept
//
//  Created by Гарик on 02.12.2022.
//

import Foundation

protocol ViewModelProtocol: AnyObject {
    var hotSalesData: Box<[HotSalesItems]> {get}
    func loadDataImage(url: String, completion: @escaping (Data?) -> Void)
}

class HotSalesViewModel: ViewModelProtocol {
    
    var hotSalesData: Box<[HotSalesItems]> = Box([])
    let url = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
    
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
            self?.hotSalesData.value = data.home_store
        }
    }
}
