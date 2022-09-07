//
//  ViewController.swift
//  Ecommerce Concept
//
//  Created by Гарик on 24.08.2022.
//

import UIKit

class MainScreen: UIViewController{
    
    private let viewModelSelectCategory = ViewModelSelectCategory()
    private let selectCategory = ViewModelSelectCategory().selectCategory
    private let viewAll = ViewModelSelectCategory().viewAll
    private let selectCategoryCollectionView = ViewModelSelectCategory().selectCategoryCollectionView
    private let searchBar = SearchBarViews().searchBar
    private let searchBarQR = SearchBarViews().searchBarQR
    private let searchBarButton = SearchBarViews().searchBarButton
    private let hotSales = HotSalesViewModel().hotSales
    private let seeMore = HotSalesViewModel().seeMore
    private let hotSalesCollectionView = HotSalesCollectionView()
    private let bestSeller = BestSellerViewModel().bestSeller
    private let seeMoreBestSeller = BestSellerViewModel().seeMoreBestSeller
    private let bestSellerCollectionView = BestSellerCollectionView()
    
    
    
    private lazy var filterItem: UIBarButtonItem = {
        let view = UIBarButtonItem(image: UIImage(named: "Filter"), style: .plain, target: self, action: #selector(filterPressed))
        view.tintColor = .black
        return view
    }()
    
    private lazy var scroll: UIScrollView = {
        let scroll = UIScrollView(frame: view.frame)
        scroll.contentSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height)
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let contView = UIView()
        contView.frame = scroll.frame
        contView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        return contView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        selectCategoryCollectionView.delegate = self
        selectCategoryCollectionView.dataSource = self
        selectCategoryCollectionView.register(SelectCategoryCollectionViewCell.self, forCellWithReuseIdentifier: "SelectCategoryCollectionViewCell")
        setupConstraints()
    }
    
    
    
    @objc func filterPressed() {
        
        let popOverController = FiltersOptionsView()
        popOverController.modalPresentationStyle = .popover
        popOverController.preferredContentSize = CGSize(width: view.bounds.width, height: view.bounds.height / 2 - 86)
        popOverController.view.alpha = 0
        
        guard let presentationVC = popOverController.popoverPresentationController else {return}
        
        presentationVC.delegate = self
        presentationVC.sourceView = view
        presentationVC.permittedArrowDirections = []
        presentationVC.sourceRect = CGRect(x: 0, y: view.frame.midY, width: view.frame.width + 100, height: 0)
        
        self.present(popOverController, animated: true, completion: nil)
        
        
    }
    
    private func setupViews() {
        view.addSubview(scroll)
        scroll.addSubview(contentView)
        navigationItem.rightBarButtonItem = filterItem
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        let arrayViews = [selectCategory, viewAll, selectCategoryCollectionView, searchBar, searchBarQR, searchBarButton, hotSales, seeMore, hotSalesCollectionView, bestSeller, seeMoreBestSeller, bestSellerCollectionView]
        arrayViews.forEach(contentView.addSubview)
        searchBarButton.addSubview(searchBarQR)
    }
    
    private func setupConstraints() {
        
        selectCategory.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 17).isActive = true
        selectCategory.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18).isActive = true
        selectCategory.widthAnchor.constraint(equalToConstant: 200).isActive = true
        selectCategory.heightAnchor.constraint(equalToConstant: 32 ).isActive = true
        
        viewAll.widthAnchor.constraint(equalToConstant: 59).isActive = true
        viewAll.heightAnchor.constraint(equalToConstant: 19).isActive = true
        viewAll.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25).isActive = true
        viewAll.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -17).isActive = true
        
        selectCategoryCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        selectCategoryCollectionView.topAnchor.constraint(equalTo: selectCategory.bottomAnchor, constant: 24).isActive = true
        selectCategoryCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        selectCategoryCollectionView.heightAnchor.constraint(equalToConstant: 115).isActive = true
        
        searchBar.heightAnchor.constraint(equalToConstant: 34).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        searchBar.topAnchor.constraint(equalTo: selectCategoryCollectionView.bottomAnchor, constant: 33).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: searchBarButton.leadingAnchor, constant: -11).isActive = true
        
        searchBarButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -37).isActive = true
        searchBarButton.topAnchor.constraint(equalTo: selectCategoryCollectionView.bottomAnchor, constant: 33).isActive = true
        searchBarButton.widthAnchor.constraint(equalToConstant: 34).isActive = true
        searchBarButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        searchBarQR.centerXAnchor.constraint(equalTo: searchBarButton.centerXAnchor).isActive = true
        searchBarQR.centerYAnchor.constraint(equalTo: searchBarButton.centerYAnchor).isActive = true
        searchBarQR.widthAnchor.constraint(equalToConstant: 14.78).isActive = true
        searchBarQR.heightAnchor.constraint(equalToConstant: 14.78).isActive = true
        
        hotSales.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 17).isActive = true
        hotSales.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 24).isActive = true
        hotSales.widthAnchor.constraint(equalToConstant: 200).isActive = true
        hotSales.heightAnchor.constraint(equalToConstant: 32 ).isActive = true
        
        seeMore.widthAnchor.constraint(equalToConstant: 74).isActive = true
        seeMore.heightAnchor.constraint(equalToConstant: 19).isActive = true
        seeMore.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 31).isActive = true
        seeMore.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -17).isActive = true
        
        
        hotSalesCollectionView.topAnchor.constraint(equalTo: hotSales.bottomAnchor, constant: 8).isActive = true
        hotSalesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        hotSalesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        hotSalesCollectionView.heightAnchor.constraint(equalToConstant: 182).isActive = true
        
        bestSeller.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 17).isActive = true
        bestSeller.topAnchor.constraint(equalTo: hotSalesCollectionView.bottomAnchor, constant: 13).isActive = true
        bestSeller.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bestSeller.heightAnchor.constraint(equalToConstant: 32 ).isActive = true
        
        seeMoreBestSeller.widthAnchor.constraint(equalToConstant: 74).isActive = true
        seeMoreBestSeller.heightAnchor.constraint(equalToConstant: 19).isActive = true
        seeMoreBestSeller.topAnchor.constraint(equalTo: hotSalesCollectionView.bottomAnchor, constant: 20).isActive = true
        seeMoreBestSeller.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -17).isActive = true
        
        bestSellerCollectionView.topAnchor.constraint(equalTo: bestSeller.bottomAnchor, constant: 8).isActive = true
        bestSellerCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bestSellerCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bestSellerCollectionView.heightAnchor.constraint(equalToConstant: 520 ).isActive = true
        bestSellerCollectionView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor).isActive = true
    }
}

extension MainScreen: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        viewModelSelectCategory.setCollectionViewCell(collectionView, cellForItemAt: indexPath)
    }
}

extension MainScreen: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModelSelectCategory.didSelectCollectionViewCell(collectionView, didSelectItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        viewModelSelectCategory.didDeselectcollectionViewCell(collectionView, didDeselectItemAt: indexPath)
    }
    
}

extension UIPresentationController {
    
    
    
}

extension MainScreen: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 71, height: 71 * 1.6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(23)
    }
}

extension MainScreen: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
    
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        false
    }
    
}




