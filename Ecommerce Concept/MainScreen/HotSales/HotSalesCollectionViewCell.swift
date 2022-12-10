//
//  HotSalesCollectionViewCell.swift
//  Ecommerce Concept
//
//  Created by Гарик on 02.12.2022.
//

import UIKit

class HotSalesCollectionViewCell: UICollectionViewCell {
    
    lazy var buttonBuy : UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.setTitle("Buy Now!", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 11)
        return view
    }()
    
    lazy var phoneImage : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.addSubview(phoneName)
        return view
    }()
    
    lazy var phoneName : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .white
        view.font = UIFont(name: "MarkPro-Bold", size: 25)
        view.backgroundColor = .black
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    lazy var descriptionPhone : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .white
        view.font = UIFont(name: "MarkPro", size: 11)
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    lazy var viewNew : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "FF6E4E")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 13
        view.addSubview(labelNew)
        view.isHidden = true
        return view
    }()
    
    lazy var labelNew : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "MarkPro-Bold", size: 10)
        view.textColor = .white
        view.text = "New"
        view.isHidden = true
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(buttonBuy)
        addSubview(phoneImage)
        addSubview(descriptionPhone)
        addSubview(viewNew)
        addSubview(labelNew)
        layer.cornerRadius = 10
        backgroundColor = .black
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        viewNew.widthAnchor.constraint(equalToConstant: 27).isActive = true
        viewNew.heightAnchor.constraint(equalToConstant: 27).isActive = true
        viewNew.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28).isActive = true
        viewNew.topAnchor.constraint(equalTo: topAnchor, constant: 17).isActive = true
        
        labelNew.centerXAnchor.constraint(equalTo: viewNew.centerXAnchor).isActive = true
        labelNew.centerYAnchor.constraint(equalTo: viewNew.centerYAnchor).isActive = true
        
        phoneName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        phoneName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28).isActive = true        
        
        descriptionPhone.widthAnchor.constraint(equalToConstant: 115).isActive = true
        descriptionPhone.heightAnchor.constraint(equalToConstant: 13).isActive = true
        descriptionPhone.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28).isActive = true
        descriptionPhone.topAnchor.constraint(equalTo: phoneName.bottomAnchor, constant: 7).isActive = true
        
        buttonBuy.widthAnchor.constraint(equalToConstant: 98).isActive = true
        buttonBuy.heightAnchor.constraint(equalToConstant: 23).isActive = true
        buttonBuy.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28).isActive = true
        buttonBuy.topAnchor.constraint(equalTo: descriptionPhone.bottomAnchor, constant: 26).isActive = true
        buttonBuy.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        
        phoneImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        phoneImage.heightAnchor.constraint(equalToConstant: 205).isActive = true
        phoneImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        phoneImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        
    }
}
