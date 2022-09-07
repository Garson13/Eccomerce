//
//  BestSellerViewModel.swift
//  Ecommerce Concept
//
//  Created by Гарик on 31.08.2022.
//

import UIKit

class BestSellerViewModel {
    
    var bestSellersData: [BestSellerItems] = []
    var images: [UIImage] = []
    
    lazy var bestSeller: UILabel = {
        let view = UILabel()
        view.text = "Best Seller"
        view.font = UIFont(name: "MarkPro-Bold", size: 25)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var seeMoreBestSeller: UILabel = {
        let view = UILabel()
        view.text = "see more"
        view.font = UIFont(name: "Mark Pro", size: 15)
        view.textColor = UIColor(named: "FF6E4E")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func uploadData(collectionView: UICollectionView) {
        guard let url = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175") else { return  }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async { [weak self] in
                guard let data = data else {
                    return
                }
                do {
                    let dataTask = try JSONDecoder().decode(MainScreenModel.self, from: data)
                    self?.bestSellersData = dataTask.best_seller
                    dataTask.best_seller.forEach { items in
                        let image = self?.loadImage(url: items.picture)
                        self?.images.append(image ?? UIImage())
                    }
                    collectionView.reloadData()
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    func loadImage(url: String?) -> UIImage? {
        guard
            let url = URL(string: url ?? ""),
            let data = try? Data(contentsOf: url)
        else {
            print("Ошибка")
            return nil
        }
        return UIImage(data: data)
    }
    
    func numbersOfItemsCollectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bestSellersData.count
    }
    
    func cellForCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as! BestSellerCell
        let model = bestSellersData[indexPath.row]
        cell.phoneName.text = model.title
        cell.phoneImage.image = images[indexPath.row]
        cell.priceWithoutDiscont.text = "$\(String(model.price_without_discount))"
        cell.discountPrice.text = "$\(String(model.discount_price))"
        return cell
    }
    
}
