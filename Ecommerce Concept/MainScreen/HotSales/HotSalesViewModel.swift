//
//  HotSalesViewModel.swift
//  Ecommerce Concept
//
//  Created by Гарик on 29.08.2022.
//

import UIKit

class HotSalesViewModel {
    
    var hotSalesData: [HotSalesItems] = []
    var images: [UIImage] = []
    
    lazy var hotSales: UILabel = {
        let view = UILabel()
        view.text = "Hot sales"
        view.font = UIFont(name: "MarkPro-Bold", size: 25)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var seeMore: UILabel = {
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
                    self?.hotSalesData = dataTask.home_store
                    dataTask.home_store.forEach { items in
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
        hotSalesData.count
    }
    
    func cellForCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotSalesCollectionViewCell", for: indexPath) as! HotSalesCollectionViewCell
        let model = hotSalesData[indexPath.row]
        cell.phoneImage.image = images[indexPath.row]
        cell.phoneName.text = model.title
        cell.descriptionPhone.text = model.subtitle
        if model.is_new ?? false {
            cell.viewNew.isHidden = false
            cell.labelNew.isHidden = false
        }
        return cell
    }
}
