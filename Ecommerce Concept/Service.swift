//
//  Service.swift
//  Ecommerce Concept
//
//  Created by Гарик on 03.12.2022.
//

import Foundation


class Service {
    
    static func uploadData(url: String, completion: @escaping (MainScreenModel) -> Void) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    return
                }
                do {
                    let dataTask = try JSONDecoder().decode(MainScreenModel.self, from: data)
                    completion(dataTask)
                } catch {
                    print(error.localizedDescription)
                }
        }
        task.resume()
    }
    
    static func uploadDetailData(url: String, completion: @escaping (ProductDetailsModel) -> Void) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    return
                }
                do {
                    let dataTask = try JSONDecoder().decode(ProductDetailsModel.self, from: data)
                    completion(dataTask)
                } catch {
                    print(error.localizedDescription)
                }
        }
        task.resume()
    }

    static func uploadMyCartData(url: String, completion: @escaping (MyCartModel) -> Void) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    return
                }
                do {
                    let dataTask = try JSONDecoder().decode(MyCartModel.self, from: data)
                    completion(dataTask)
                } catch {
                    print(error.localizedDescription)
                }
        }
        task.resume()
    }
    
    static func loadImage(url: String?, completion: @escaping (Data?) -> Void) {
        guard
            let url = URL(string: url ?? "")
        else {
            print("Ошибка")
            return
        }
        DispatchQueue.global(qos: .utility).async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
    
    
    
}
