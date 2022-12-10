//
//  FiltersOptions.swift
//  Ecommerce Concept
//
//  Created by Гарик on 02.12.2022.
//

import UIKit

class FiltersOptionsView: UIViewController {
    
    private var arraySectionName: [String] = ["Brand", "Price", "Size"]
    private var brandName = "Samsung"
    private var price = "$300 - $500"
    private var size = "4.5 to 5.5 inches"
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.rowHeight = 40
        table.allowsSelection = false
        table.isScrollEnabled = false
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
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 9
        view.layer.shadowColor = UIColor.black.cgColor
        view.addSubview(closeButton)
        view.addSubview(labelFilterOptions)
        view.addSubview(doneButton)
        view.addSubview(tableView)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(mainView)
        setupConstraints()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FIltersOptitonsCell.self, forCellReuseIdentifier: "FIltersOptitonsCell")
    }
    
    
    @objc private func tappedCloseButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func tappedDoneButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func openPriceSelection(_ sender: UISlider) {
        let vc = OpenPriceSelection()
        vc.modalPresentationStyle = .popover
        
        guard let presentationController = vc.popoverPresentationController else {return}
        
        guard let cell = tableView.cellForRow(at: [1,0]) else {return}
        presentationController.permittedArrowDirections = []
        
        presentationController.sourceView = cell
        vc.preferredContentSize = CGSize(width: 200, height: 40)
        presentationController.sourceRect = CGRect(x: cell.bounds.midX, y: cell.bounds.maxY, width: 0, height: 55)
        presentationController.delegate = self
        
        present(vc, animated: true)
    }
    
    @objc private func phoneNameTapped(_ sender: UIButton) {
        let samsung = UIAction(title: "Samsung") { [weak self] action in
            self?.brandName = action.title
            self?.tableView.reloadData()
        }
        let xiaomi = UIAction(title: "Xiaomi") { [weak self] action in
            self?.brandName = action.title
            self?.tableView.reloadData()
        }
        
        let menu = UIMenu(children: [samsung, xiaomi])
        menu.preferredElementSize = .large
        sender.showsMenuAsPrimaryAction = true
        sender.menu = menu
    }
    
    private func setupConstraints() {
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: view.bounds.size.height / 2).isActive = true
        
        labelFilterOptions.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 31).isActive = true
        labelFilterOptions.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 24).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 44).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 37).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 37).isActive = true
        
        doneButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 24).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 86).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 37).isActive = true
        
        tableView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44).isActive = true
        tableView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
    }
}

extension FiltersOptionsView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FIltersOptitonsCell()
        switch indexPath.section {
        case 0:
            cell.selectionFilters.setTitle(brandName, for: .normal)
            cell.selectionFilters.addTarget(self, action: #selector(phoneNameTapped), for: .touchUpInside)
            return cell
        case 1:
            cell.selectionFilters.setTitle(price, for: .normal)
            cell.selectionFilters.addTarget(self, action: #selector(openPriceSelection), for: .touchUpInside)
            return cell
        case 2:
            cell.selectionFilters.setTitle(size, for: .normal)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let name = arraySectionName[section]
        return name
    }
    
}

extension FiltersOptionsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let heaeder = view as? UITableViewHeaderFooterView
        guard let header = heaeder else {return}
        header.textLabel?.textColor = .black
        header.textLabel?.font = UIFont(name: "MarkPro-Medium", size: 18)
        header.bounds.size.width = 100
        header.textLabel?.translatesAutoresizingMaskIntoConstraints = false
        header.textLabel?.leadingAnchor.constraint(equalTo: header.leadingAnchor).isActive = true
        header.textLabel?.topAnchor.constraint(equalTo: header.topAnchor, constant: -10).isActive = true
    }
}

extension FiltersOptionsView: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        .none
    }
}

