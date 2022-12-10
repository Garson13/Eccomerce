//
//  BestSellerCollectionView.swift
//  Ecommerce Concept
//
//  Created by Гарик on 02.12.2022.
//

import UIKit

class BestSellerCollectionView: UICollectionView {
    
    private var bestSellersData: [BestSellerItems] = []
    let bestSellerViewModel: BestSellerViewModelProtocol?
    
    init() {
        bestSellerViewModel = BestSellerViewModel()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        configuaration()
        dataBind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func dataBind() {
        bestSellerViewModel?.bestSellerData.bind({ [weak self] arrayData in
            self?.bestSellersData = arrayData
            DispatchQueue.main.async {
                self?.reloadData()
            }
        })
    }
    
    private func configuaration() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        showsVerticalScrollIndicator = false
        contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 21)
        dataSource = self
        register(BestSellerCell.self, forCellWithReuseIdentifier: "BestSellerCell")
    }
    
}

extension BestSellerCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return bestSellersData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as! BestSellerCell
        let model = bestSellersData[indexPath.row]
        cell.phoneName.text = model.title
        cell.priceWithoutDiscont.text = "$\(String(model.discount_price))"
        cell.discountPrice.text = "$\(String(model.price_without_discount))"
        DispatchQueue.global(qos: .utility).async {
            self.bestSellerViewModel?.loadDataImage(url: model.picture ?? "", completion: { data in
                guard let data = data else {return}
                DispatchQueue.main.async {
                    cell.phoneImage.image = UIImage(data: data)
                }
            })
        }
        return cell
    }
}
