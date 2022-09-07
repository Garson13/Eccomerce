//
//  FIltersOptitonsCell.swift
//  Ecommerce Concept
//
//  Created by Гарик on 02.09.2022.
//

import UIKit

class FIltersOptitonsCell: UITableViewCell {
    
    lazy var brandLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "MarkPro-Medium", size: 18)
        label.textAlignment = .left
        return label
    }()
    
    lazy var selectionFilters: UIButton = {
        let view = UIButton()
        view.configuration = .borderless()
        view.configuration?.background.strokeColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = UIFont(name: "MarkPro", size: 18)
        view.contentHorizontalAlignment = .left
        view.addSubview(cursorView)
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 5
        view.addArrangedSubview(brandLabel)
        view.addArrangedSubview(selectionFilters)
        view.backgroundColor = .white
        return view
    }()
    
    lazy var cursorView: UIImageView  = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Cursor filter button")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "FIltersOptitonsCell")
        translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        selectionFilters.widthAnchor.constraint(equalToConstant: 338).isActive = true
        
        cursorView.topAnchor.constraint(equalTo: selectionFilters.topAnchor, constant: 15).isActive = true
        cursorView.bottomAnchor.constraint(equalTo: selectionFilters.bottomAnchor, constant: -14).isActive = true
        cursorView.trailingAnchor.constraint(equalTo: selectionFilters.trailingAnchor, constant: -20).isActive = true
        
    }
}


