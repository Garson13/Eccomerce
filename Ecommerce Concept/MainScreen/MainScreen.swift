//
//  ViewController.swift
//  Ecommerce Concept
//
//  Created by Гарик on 02.12.2022.
//

import UIKit

class MainScreen: UIViewController {
    
    private let selectCategoryCollectionView = SelectCategoryCollectionView()
    private let selectCategory = Views.selectCategory
    private let viewAll = Views.viewAll
    private let searchBar = Views.searchBar
    private let searchBarQR = Views.searchBarQR
    private let searchBarButton = Views.searchBarButton
    private let hotSales = Views.hotSales
    private let seeMore = Views.seeMore
    private let hotSalesCollectionView = HotSalesCollectionView()
    private let bestSeller = Views.bestSeller
    private let seeMoreBestSeller = Views.seeMoreBestSeller
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
        setupConstraints()
    }
    
    
    
    @objc func filterPressed() {
        let view = FiltersOptionsView()
        view.modalPresentationStyle = .overFullScreen
        present(view, animated: true)
    }
    
    private func setupViews() {
        view.addSubview(scroll)
        scroll.addSubview(contentView)
        navigationItem.rightBarButtonItem = filterItem
        navigationItem.titleView = Views.navigationTitleView
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        let arrayViews = [selectCategory, viewAll, selectCategoryCollectionView, searchBar, searchBarQR, searchBarButton, hotSales, seeMore, hotSalesCollectionView, bestSeller, seeMoreBestSeller, bestSellerCollectionView]
        arrayViews.forEach(contentView.addSubview)
        searchBarButton.addSubview(searchBarQR)
        bestSellerCollectionView.delegate = self
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
        
        bestSellerCollectionView.topAnchor.constraint(equalTo: bestSeller.bottomAnchor, constant: 15).isActive = true
        bestSellerCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bestSellerCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bestSellerCollectionView.heightAnchor.constraint(equalToConstant: 520 ).isActive = true
        bestSellerCollectionView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor).isActive = true
    }
}


extension MainScreen: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ProductDetails()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainScreen: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.size.width / 2 - 27, height: 227)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(20)
    }
}

extension UIViewController {
    
    func addBackButton(image: UIImage) {
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        backButton.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0, blue: 0.2078431373, alpha: 1)
        backButton.layer.cornerRadius = 11
        backButton.setImage(image, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonClick), for: .touchUpInside)
        let backBarButton = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButton
    }
    
    func addCustomRightButton(image: UIImage) {
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        rightButton.backgroundColor = #colorLiteral(red: 1, green: 0.5189241767, blue: 0.3763272166, alpha: 1)
        rightButton.layer.cornerRadius = 11
        rightButton.setImage(image, for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonClick), for: .touchUpInside)
        let rightBarButton = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItems = [rightBarButton]
    }
    
    func addTitleRightButton() {
        let label = UILabel()
        label.text = "Add address"
        label.font = UIFont(name: "MarkPro", size: 13)
        label.textColor = .black
        let rightBarButton2 = UIBarButtonItem(customView: label)
        self.navigationItem.rightBarButtonItems?.append(rightBarButton2)
    }
    
    @objc func backButtonClick(sender : UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightButtonClick(sender : UIButton) {
        let vc = MyCart()
        vc.addBackButton(image: UIImage(named: "BackImage")!)
        navigationController?.pushViewController(vc, animated: true)
    }

}




