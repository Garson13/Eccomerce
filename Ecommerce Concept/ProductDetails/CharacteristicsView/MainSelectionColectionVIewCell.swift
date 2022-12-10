//
//  MainSelectionColectionVIewCell.swift
//  Ecommerce Concept
//
//  Created by Гарик on 07.12.2022.
//

import UIKit

class MainSelectionColectionVIewCell: UICollectionViewCell {
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.alpha = 0.5
        view.font = UIFont(name: "MarkPro", size: 18)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var lineView: UIView = {
       let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.5189241767, blue: 0.3763272166, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    private lazy var stackView: UIStackView = {
       let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 1
        view.addArrangedSubview(label)
        view.addArrangedSubview(lineView)
        return view
    }()
    
    func setTitle(title: String) {
        self.label.text = title
    }
    
    func isOnLineView() {
        self.lineView.isHidden = false
        self.label.font = UIFont(name: "MarkPro-Bold", size: 18)
        self.label.alpha = 1
    }
    
    func isOffLineView() {
        self.lineView.isHidden = true
        self.label.font = UIFont(name: "MarkPro", size: 18)
        self.label.alpha = 0.5
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        lineView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15).isActive = true
    }
}
