//
//  HotSales.swift
//  Ecommerce Concept
//
//  Created by Гарик on 29.08.2022.
//

import UIKit

class HotSalesCollectionView: UICollectionView {
    
    let hotSalesViewModel = HotSalesViewModel()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        isPagingEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        showsHorizontalScrollIndicator = false
        contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 21)
        delegate = self
        dataSource = self
        register(HotSalesCollectionViewCell.self, forCellWithReuseIdentifier: "HotSalesCollectionViewCell")
        hotSalesViewModel.uploadData(collectionView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HotSalesCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hotSalesViewModel.numbersOfItemsCollectionView(collectionView, numberOfItemsInSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        hotSalesViewModel.cellForCollectionView(collectionView, cellForItemAt: indexPath)
    }
}

extension HotSalesCollectionView: UICollectionViewDelegate {
    
}


extension HotSalesCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 390, height: 182)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(23)
    }
}
