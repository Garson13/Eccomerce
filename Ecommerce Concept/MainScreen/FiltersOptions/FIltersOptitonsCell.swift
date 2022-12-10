//
//  FIltersOptitonsCell.swift
//  Ecommerce Concept
//
//  Created by Гарик on 02.12.2022.

import UIKit

class FIltersOptitonsCell: UITableViewCell {
    
    lazy var selectionFilters: UIButton = {
        let view = UIButton()
        view.tintColor = #colorLiteral(red: 1, green: 0.431372549, blue: 0.3058823529, alpha: 1)
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

    lazy var cursorView: UIImageView  = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Cursor filter button")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "FIltersOptitonsCell")
        contentView.addSubview(selectionFilters)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        selectionFilters.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        selectionFilters.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        selectionFilters.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        selectionFilters.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        cursorView.topAnchor.constraint(equalTo: selectionFilters.topAnchor, constant: 15).isActive = true
        cursorView.bottomAnchor.constraint(equalTo: selectionFilters.bottomAnchor, constant: -14).isActive = true
        cursorView.trailingAnchor.constraint(equalTo: selectionFilters.trailingAnchor, constant: -20).isActive = true
        
    }
}


