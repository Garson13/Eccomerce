//
//  HotSales.swift
//  Ecommerce Concept
//
//  Created by Гарик on 02.12.2022.
//

import UIKit

class HotSalesCollectionView: UICollectionView {
    
    private let hotSalesViewModel: ViewModelProtocol?
    private var hotSalesData: [HotSalesItems] = []
    
    init() {
        hotSalesViewModel = HotSalesViewModel()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        configuratuion()
        dataBind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func dataBind() {
        hotSalesViewModel?.hotSalesData.bind({ [weak self] arrayData in
            self?.hotSalesData = arrayData
            DispatchQueue.main.async {
                self?.reloadData()
            }
        })
    }
    
    private func configuratuion() {
        isPagingEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        showsHorizontalScrollIndicator = false
        contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        delegate = self
        dataSource = self
        register(HotSalesCollectionViewCell.self, forCellWithReuseIdentifier: "HotSalesCollectionViewCell")
    }
    
}

extension HotSalesCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hotSalesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotSalesCollectionViewCell", for: indexPath) as! HotSalesCollectionViewCell
        let model = hotSalesData[indexPath.row]
        cell.phoneName.text = model.title
        cell.descriptionPhone.text = model.subtitle
        if model.is_new ?? false {
            cell.viewNew.isHidden = false
            cell.labelNew.isHidden = false
        }
        hotSalesViewModel?.loadDataImage(url: model.picture ?? "", completion: { data in
            guard let data = data else {return}
            DispatchQueue.main.async {
                cell.phoneImage.image = UIImage(data: data)
            }
        })
        return cell
    }
}

extension HotSalesCollectionView: UICollectionViewDelegateFlowLayout {
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.size.width - 30 , height: 182)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(45)
    }
}
