//
//  OpenPriceSelection.swift
//  Ecommerce Concept
//
//  Created by Гарик on 05.12.2022.
//

import UIKit

class OpenPriceSelection: UIViewController {
    
    private lazy var tf1: UITextField = {
        let view = UITextField()
        view.textAlignment = .center
        view.text = "0"
        return view
    }()
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.text = " - "
        view.textAlignment = .center
        view.textColor = .black
        view.font = UIFont(name: "MarkPro", size: 15)
        return view
    }()
    
    private lazy var tf2: UITextField = {
        let view = UITextField()
        view.textAlignment = .center
        view.text = "10000"
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        view.axis = .horizontal
        view.spacing = 5
        view.distribution = .fillEqually
        view.addArrangedSubview(tf1)
        view.addArrangedSubview(label)
        view.addArrangedSubview(tf2)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        
    }
}

