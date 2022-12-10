//
//  ViewModelSelectCategoryCollectionView.swift
//  Ecommerce Concept
//
//  Created by Гарик on 02.12.2022.
//

import UIKit


class SelectCategoryCollectionView: UICollectionView {
    
    let imagesSelectCategory: [String] = ["\u{e900}", "\u{e903}", "\u{e901}", "\u{e902}", ""]
    let namesSelectCategory: [String] = ["Phones", "Computer", "Health", "Books", ""]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        delegate = self
        dataSource = self
        register(SelectCategoryCollectionViewCell.self, forCellWithReuseIdentifier: "SelectCategoryCollectionViewCell")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        showsHorizontalScrollIndicator = false
        contentInset = UIEdgeInsets(top: 0, left: 27, bottom: 0, right: 27)
    }

}

extension SelectCategoryCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return namesSelectCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectCategoryCollectionViewCell", for: indexPath) as! SelectCategoryCollectionViewCell
        cell.name.text = namesSelectCategory[indexPath.row]
        cell.imageCell.text = imagesSelectCategory[indexPath.row]
        return cell
    }
    
}

extension SelectCategoryCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SelectCategoryCollectionViewCell
        cell.imageCell.textColor = .white
        cell.ellipse.backgroundColor = UIColor(named: "FF6E4E")
        cell.name.textColor = UIColor(named: "FF6E4E")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SelectCategoryCollectionViewCell
        if ((collectionView.indexPathsForSelectedItems?.contains(indexPath)) != nil)  {
            cell.imageCell.textColor = .gray
            cell.ellipse.backgroundColor = .white
            cell.name.textColor = .black
        }
    }
}

extension SelectCategoryCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 71, height: 71 * 1.6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(23)
    }
}
