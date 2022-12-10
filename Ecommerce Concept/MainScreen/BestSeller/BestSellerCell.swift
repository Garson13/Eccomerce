//
//  BestSellerCell.swift
//  Ecommerce Concept
//
//  Created by Гарик on 02.12.2022.
//

import UIKit

class BestSellerCell: UICollectionViewCell {
    
    private var isFavorites: Bool = true
    
    lazy var phoneName : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "MarkPro", size: 10)
        view.textColor = .black
        return view
    }()
    
    lazy var phoneImage : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var priceWithoutDiscont : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        view.font = UIFont(name: "MarkPro-Medium", size: 10)
        view.lineBreakMode = .byClipping
        view.text = "0"
        view.attributedText = NSAttributedString(string: view.text ?? "", attributes: [.strikethroughStyle : NSUnderlineStyle.single.rawValue])
        return view
    }()
    
    lazy var discountPrice : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont(name: "MarkPro-Bold", size: 16)
        view.lineBreakMode = .byClipping
        return view
    }()
    
    lazy var favoritesView : UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 13
        view.layer.shadowColor = UIColor(red: 0.656, green: 0.669, blue: 0.788, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 2
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.addSubview(favoritesItem)
        
        return view
    }()
    
    lazy var favoritesItem : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "FavoritesOff")
        return view
    }()
    
    @objc func pressedButton() {
        if isFavorites {
            isFavorites = false
            favoritesItem.image = UIImage(named: "FavoritesOn")
        } else {
            isFavorites = true
            favoritesItem.image = UIImage(named: "FavoritesOff")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(phoneName)
        addSubview(phoneImage)
        addSubview(discountPrice)
        addSubview(priceWithoutDiscont)
        addSubview(favoritesView)
        addSubview(favoritesItem)
        backgroundColor = .white
        layer.cornerRadius = 10
        clipsToBounds = true
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        phoneImage.heightAnchor.constraint(equalToConstant: 168).isActive = true
        phoneImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        phoneImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        phoneImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        phoneImage.bottomAnchor.constraint(equalTo: discountPrice.topAnchor, constant: 5).isActive = true
        
        favoritesView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        favoritesView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        favoritesView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        favoritesView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        
        favoritesItem.centerXAnchor.constraint(equalTo: favoritesView.centerXAnchor).isActive = true
        favoritesItem.centerYAnchor.constraint(equalTo: favoritesView.centerYAnchor).isActive = true
        
        discountPrice.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21).isActive = true
        discountPrice.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -33).isActive = true
        
        priceWithoutDiscont.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -39).isActive = true
        priceWithoutDiscont.leadingAnchor.constraint(equalTo: discountPrice.trailingAnchor, constant: 5).isActive = true
        
        phoneName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21).isActive = true
        phoneName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        phoneName.topAnchor.constraint(equalTo: discountPrice.bottomAnchor, constant: 6).isActive = true
    }
}
