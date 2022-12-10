//
//  MyCartTableViewCell.swift
//  Ecommerce Concept
//
//  Created by Гарик on 10.12.2022.
//

import UIKit

class MyCartTableViewCell: UITableViewCell {
    
    private lazy var image: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.text = ""
        view.textColor = .white
        view.font = UIFont(name: "MarkPro", size: 19)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let view = UILabel()
        view.text = "$0"
        view.textColor = UIColor(named: "FF6E4E")
        view.font = UIFont(name: "MarkPro", size: 19)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var trashButton: UIButton = {
        let view = UIButton()
        view.tintColor = #colorLiteral(red: 0.2081801295, green: 0.2133497298, blue: 0.3324833512, alpha: 1)
        view.setImage(UIImage(systemName: "trash"), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var minusButton: UIButton = {
        let view = UIButton()
        view.setTitle("-", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var plusButton: UIButton = {
        let view = UIButton()
        view.setTitle("+", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var amountLabel: UILabel = {
        let view = UILabel()
        view.text = "1"
        view.textColor = .white
        view.font = UIFont(name: "MarkPro", size: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var amountStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.backgroundColor = #colorLiteral(red: 0.2081801295, green: 0.2133497298, blue: 0.3324833512, alpha: 1)
        view.alignment = .center
        view.addArrangedSubview(minusButton)
        view.addArrangedSubview(amountLabel)
        view.addArrangedSubview(plusButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var amountView: UIView = {
       let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2081801295, green: 0.2133497298, blue: 0.3324833512, alpha: 1)
        view.addSubview(amountStackView)
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "MyCartTableViewCell")
        setupViews()
        setupConstraints()
        backgroundColor = UIColor(named: "010035")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(image)
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(amountView)
        addSubview(trashButton)
    }
    
    func setupData(title: String, price: Int) {
        self.titleLabel.text = title
        self.priceLabel.text = "$\(price).00"
        
    }
    
    func setImage(image: UIImage) {
        self.image.image = image
    }
    private func setupConstraints() {
        image.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
        image.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10).isActive = true
        image.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        priceLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        amountView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        amountView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        amountView.trailingAnchor.constraint(equalTo: trashButton.leadingAnchor, constant: -10).isActive = true
        amountView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5).isActive = true

        
        trashButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        trashButton.topAnchor.constraint(equalTo: topAnchor, constant: 35).isActive = true
        trashButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -35).isActive = true
        
        amountStackView.topAnchor.constraint(equalTo: amountView.topAnchor).isActive = true
        amountStackView.leadingAnchor.constraint(equalTo: amountView.leadingAnchor).isActive = true
        amountStackView.trailingAnchor.constraint(equalTo: amountView.trailingAnchor).isActive = true
        amountStackView.bottomAnchor.constraint(equalTo: amountView.bottomAnchor).isActive = true
    }
}
