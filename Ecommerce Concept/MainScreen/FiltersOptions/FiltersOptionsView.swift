//
//  FiltersOptions.swift
//  Ecommerce Concept
//
//  Created by Гарик on 01.09.2022.
//

import UIKit

class FiltersOptionsView: UIViewController {
    
    private var arrayBrandLabel: [String] = ["Brand", "Price", "Size"]
    private var arraySelection: [String] = ["Samsung", "$300 - $500", "4.5 to 5.5 inches"]
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.rowHeight = 77
        table.allowsSelection = false
        return table
    }()
    
    private lazy var closeButton : UIButton = {
        let view = UIButton(type: .system)
        view.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.setImage(UIImage(named: "Close button"), for: .normal)
        view.tintColor = .white
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont(name: "MarkPro-Medium", size: 11)
        return view
    }()
    
    private lazy var doneButton : UIButton = {
        let view = UIButton(type: .system)
        view.addTarget(self, action: #selector(tappedDoneButton), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor =  UIColor(named: "FF6E4E")
        view.layer.cornerRadius = 10
        view.setTitle("Done", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont(name: "MarkPro-Medium", size: 18)
        return view
    }()
    
    private lazy var labelFilterOptions: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Filter options"
        label.font = UIFont(name: "MarkPro-Medium", size: 18)
        label.textColor = .black
        label.textAlignment = .center
        label.lineBreakMode = .byClipping
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(closeButton)
        view.addSubview(doneButton)
        view.addSubview(labelFilterOptions)
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FIltersOptitonsCell.self, forCellReuseIdentifier: "FIltersOptitonsCell")
    }
    
    
    @objc private func tappedCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func tappedDoneButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    private func setupConstraints() {
        labelFilterOptions.topAnchor.constraint(equalTo: view.topAnchor, constant: 31).isActive = true
        labelFilterOptions.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 135).isActive = true
        
        
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 37).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 37).isActive = true
        
        doneButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 44).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 86).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 37).isActive = true
        
        tableView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 43).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: 337).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 240).isActive = true
    }
}

extension FiltersOptionsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FIltersOptitonsCell") as! FIltersOptitonsCell
        cell.brandLabel.text = arrayBrandLabel[indexPath.row]
        cell.selectionFilters.setTitle(arraySelection[indexPath.row], for: .normal)
        return cell
    }
    
    
}

extension FiltersOptionsView: UITableViewDelegate {
    
}

