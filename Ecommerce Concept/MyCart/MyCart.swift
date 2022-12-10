//
//  MyCart.swift
//  Ecommerce Concept
//
//  Created by Гарик on 02.12.2022.
//

import UIKit

class MyCart: UIViewController {
    
    private var myCartData: MyCartModel?
    private var viewModel: MyCartViewModel?
    
    private lazy var titleMyCart: UILabel = {
       let label = UILabel()
        label.text = "My Cart"
        label.font = UIFont(name: "MarkPro-Bold", size: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mainView: MyCartView = {
       let view = MyCartView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "010035")
        view.layer.cornerRadius = 25
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 7
        view.layer.shadowOpacity = 0.1
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        setupConstraints()
        binding()
    }
    
    private func configuration() {
        viewModel = MyCartViewModel()
        addCustomRightButton(image: UIImage(named: "Location2")!)
        addTitleRightButton()
        view.addSubview(titleMyCart)
        view.addSubview(mainView)
        view.backgroundColor = .white
        mainView.tableView.dataSource = self
    }
    
    private func binding() {
        viewModel?.myCartData.bind({ [weak self] data in
            guard let data = data else {return}
            self?.myCartData = data
            DispatchQueue.main.async {
                self?.mainView.setupData(total: data.total, delivery: data.delivery)
                self?.tabBarController?.viewControllers?[1].tabBarItem.badgeValue = String(data.basket.count)
                self?.tabBarController?.viewControllers?[1].tabBarItem.badgeColor = UIColor(named: "FF6E4E")
                self?.mainView.tableView.reloadData()
            }
        })
    }
    
    private func setupConstraints() {
        titleMyCart.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        titleMyCart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        
        mainView.topAnchor.constraint(equalTo: titleMyCart.bottomAnchor, constant: 40).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }
}

extension MyCart: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = myCartData?.basket else {return 0}
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCartTableViewCell", for: indexPath) as! MyCartTableViewCell
        guard let data  = myCartData?.basket else {return UITableViewCell() }
        let model = data[indexPath.row]
        cell.setupData(title: model.title, price: model.price)
        viewModel?.loadDataImage(url: model.images, completion: { data in
            guard let data = data else { return }
            cell.setImage(image: UIImage(data: data)!)
        })
        return cell
    }
    
    
}
