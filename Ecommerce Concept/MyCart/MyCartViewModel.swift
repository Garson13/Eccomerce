//
//  MyCartViewModel.swift
//  Ecommerce Concept
//
//  Created by Гарик on 10.12.2022.
//

import Foundation


protocol MyCartViewModelProtocol: AnyObject {
    var myCartData: Box<MyCartModel?> {get}
    func loadDataImage(url: String, completion: @escaping (Data?) -> Void)
}

class MyCartViewModel: MyCartViewModelProtocol {
    
    let url = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    var myCartData: Box<MyCartModel?> = Box(nil)
    
    
    init() {
        loadData()
    }
    
    func loadDataImage(url: String, completion: @escaping (Data?) -> Void) {
        Service.loadImage(url: url) { data in
            completion(data)
        }
    }
    
    private func loadData() {
        Service.uploadMyCartData(url: url) { [weak self] data in
            self?.myCartData.value = data
        }
    }
}
