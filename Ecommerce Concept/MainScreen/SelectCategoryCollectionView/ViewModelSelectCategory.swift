//
//  ViewModelSelectCategoryCollectionView.swift
//  Ecommerce Concept
//
//  Created by Гарик on 27.08.2022.
//

import UIKit


class ViewModelSelectCategory {
    
    let imagesSelectCategory: [String] = ["\u{e900}", "\u{e903}", "\u{e901}", "\u{e902}", ""]
    let namesSelectCategory: [String] = ["Phones", "Computer", "Health", "Books", ""]
    
    lazy var selectCategoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        view.showsHorizontalScrollIndicator = false
        view.contentInset = UIEdgeInsets(top: 0, left: 27, bottom: 0, right: 27)
        return view
    }()
    
    
    lazy var selectCategory: UILabel = {
        let view = UILabel()
        view.text = "Select Category"
        view.font = UIFont(name: "MarkPro-Bold", size: 25)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var viewAll: UILabel = {
        let view = UILabel()
        view.text = "view all"
        view.font = UIFont(name: "Mark Pro", size: 15)
        view.textColor = UIColor(named: "FF6E4E")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setCollectionViewCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectCategoryCollectionViewCell", for: indexPath) as! SelectCategoryCollectionViewCell
        cell.name.text = namesSelectCategory[indexPath.row]
        cell.imageCell.text = imagesSelectCategory[indexPath.row]
        return cell
    }
    
    
    func didSelectCollectionViewCell(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SelectCategoryCollectionViewCell
        cell.imageCell.textColor = .white
        cell.ellipse.backgroundColor = UIColor(named: "FF6E4E")
        cell.name.textColor = UIColor(named: "FF6E4E")
        
    }
    
    func didDeselectcollectionViewCell(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SelectCategoryCollectionViewCell
        if ((collectionView.indexPathsForSelectedItems?.contains(indexPath)) != nil)  {
            cell.imageCell.textColor = .gray
            cell.ellipse.backgroundColor = .white
            cell.name.textColor = .black
        }
    }
}
