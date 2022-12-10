//
//  MyCartView.swift
//  Ecommerce Concept
//
//  Created by Гарик on 10.12.2022.
//

import UIKit

class MyCartView: UIView {
    
    private var myCartData: MyCartModel?
    
    lazy var tableView: UITableView = {
       let view = UITableView()
        view.allowsSelection = false
        view.backgroundColor = UIColor(named: "010035")
        view.separatorStyle = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var totalLabel: UILabel = {
       let label = UILabel()
        label.text = "Total"
        label.textColor = .white
        label.font = UIFont(name: "MarkPro", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var totalPriceLabel: UILabel = {
       let label = UILabel()
        label.text = "$0 us"
        label.textColor = .white
        label.font = UIFont(name: "MarkPro-Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var deliveryLabel: UILabel = {
       let label = UILabel()
        label.text = "Delivery"
        label.textColor = .white
        label.font = UIFont(name: "MarkPro", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var deliveryValue: UILabel = {
       let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont(name: "MarkPro-Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var checkoutButton: UIButton = {
       let view = UIButton()
        view.setTitle("Checkout", for: .normal)
        view.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 17)
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(named: "FF6E4E")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var topLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomLineView: UIView = {
        let view = UIView()
        view.alpha = 0.5
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(total: Int, delivery: String) {
        self.totalPriceLabel.text = "$\(total) us"
        self.deliveryValue.text = delivery
    }
    
    private func setupViews() {
        addSubview(tableView)
        addSubview(checkoutButton)
        addSubview(topLineView)
        addSubview(bottomLineView)
        addSubview(totalLabel)
        addSubview(deliveryLabel)
        addSubview(totalPriceLabel)
        addSubview(deliveryValue)
        tableView.register(MyCartTableViewCell.self, forCellReuseIdentifier: "MyCartTableViewCell")
    }
    
    private func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: checkoutButton.topAnchor, constant: -120).isActive = true
        
        checkoutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -110).isActive = true
        checkoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45).isActive = true
        checkoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45).isActive = true
        checkoutButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        topLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomLineView.bottomAnchor.constraint(equalTo: checkoutButton.topAnchor, constant: -20).isActive = true
        bottomLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        bottomLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        
        topLineView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 5).isActive = true
        topLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        topLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        
        totalLabel.topAnchor.constraint(equalTo: topLineView.topAnchor, constant: 15).isActive = true
        totalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true

        deliveryLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 15).isActive = true
        deliveryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        
        totalPriceLabel.topAnchor.constraint(equalTo: topLineView.topAnchor, constant: 15).isActive = true
        totalPriceLabel.leadingAnchor.constraint(equalTo: totalLabel.trailingAnchor, constant: 210).isActive = true

        deliveryValue.topAnchor.constraint(equalTo: totalPriceLabel.bottomAnchor, constant: 15).isActive = true
        deliveryValue.leadingAnchor.constraint(equalTo: deliveryLabel.trailingAnchor, constant: 210).isActive = true
    }
}
