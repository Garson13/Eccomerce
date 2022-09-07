//
//  BestSellerCollectionView.swift
//  Ecommerce Concept
//
//  Created by Гарик on 31.08.2022.
//

import UIKit

class BestSellerCollectionView: UICollectionView {
    
    let bestSellerViewModel = BestSellerViewModel()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        showsVerticalScrollIndicator = false
        contentInset = UIEdgeInsets(top: 21, left: 15, bottom: 0, right: 21)
        delegate = self
        dataSource = self
        register(BestSellerCell.self, forCellWithReuseIdentifier: "BestSellerCell")
        bestSellerViewModel.uploadData(collectionView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BestSellerCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bestSellerViewModel.numbersOfItemsCollectionView(collectionView, numberOfItemsInSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        bestSellerViewModel.cellForCollectionView(collectionView, cellForItemAt: indexPath)
    }
}

extension BestSellerCollectionView: UICollectionViewDelegate {
    
}


extension BestSellerCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 227)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(12)
    }
}
