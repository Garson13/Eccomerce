//
//  SelectCategoryCollectionViewCell.swift
//  Ecommerce Concept
//
//  Created by Гарик on 26.08.2022.
//

import UIKit

class SelectCategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentif = "SelectCategoryCollectionViewCell"
    
    lazy var imageCell: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.textColor = .gray
        view.font = UIFont(name: "icomoon", size: 32)
        view.alpha = 0.5
        return view
    }()
    
    lazy var ellipse: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 36
        view.addSubview(imageCell)
        view.layer.shadowColor = UIColor(red: 0.656, green: 0.669, blue: 0.788, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 2
        view.layer.shadowOffset = CGSize(width: 3, height: 0)
        return view
    }()
    
    lazy var name: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont(name: "MarkPro-Medium", size: 12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageCell)
        addSubview(ellipse)
        addSubview(name)
        setupConstraints()
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        imageCell.centerYAnchor.constraint(equalTo: ellipse.centerYAnchor).isActive = true
        imageCell.centerXAnchor.constraint(equalTo: ellipse.centerXAnchor).isActive = true
        
        
        name.topAnchor.constraint(equalTo: ellipse.bottomAnchor, constant: 7).isActive = true
        name.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
        ellipse.widthAnchor.constraint(equalToConstant: 71).isActive = true
        ellipse.heightAnchor.constraint(equalToConstant: 71).isActive = true
        ellipse.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        ellipse.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        ellipse.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
}
