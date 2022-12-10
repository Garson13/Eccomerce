//
//  PhoneCollectionCell.swift
//  Ecommerce Concept
//
//  Created by Гарик on 10.12.2022.
//

import UIKit

class PhoneCollectionCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
       let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        layer.cornerRadius = 30
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.2
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(image: UIImage) {
        self.imageView.image = image
    }
    
    private func setupConstraints() {
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

    }
    
}
