//
//  ProductDetailsVIewModel.swift
//  Ecommerce Concept
//
//  Created by Гарик on 07.12.2022.
//

import Foundation

protocol ProductDetailsViewModelProtocol: AnyObject {
    var detailData: Box<ProductDetailsModel?> {get}
    func loadDataImage(url: String, completion: @escaping (Data?) -> Void)
}

class ProductDetailsVIewModel: ProductDetailsViewModelProtocol {
    
    let url = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    var detailData: Box<ProductDetailsModel?> = Box(nil)
    
    
    init() {
        loadData()
    }
    
    func loadDataImage(url: String, completion: @escaping (Data?) -> Void) {
        Service.loadImage(url: url) { data in
            completion(data)
        }
    }
    
    private func loadData() {
        Service.uploadDetailData(url: url) { [weak self] data in
            self?.detailData.value = data
        }
    }
}
