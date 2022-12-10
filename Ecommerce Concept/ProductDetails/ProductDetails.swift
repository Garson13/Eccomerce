//
//  ProductDetails.swift
//  Ecommerce Concept
//
//  Created by Гарик on 02.12.2022.
//

import UIKit
import AnimatedCollectionViewLayout

class ProductDetails: UIViewController {
    
    private lazy var imageURLs: [String] = []
    
    private lazy var mainView: SetupDetailView = {
        let view = SetupDetailView(frame: CGRect(x: 0, y: self.view.frame.midY - 30, width: self.view.bounds.size.width, height: self.view.bounds.size.height / 2))
        view.layer.cornerRadius = 40
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 7
        view.layer.shadowOpacity = 0.1
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
       let layot = AnimatedCollectionViewLayout()
        layot.animator = LinearCardAttributesAnimator()
        layot.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layot)
        view.isPagingEnabled = true
        view.contentInset = UIEdgeInsets(top: -170, left: 30, bottom: 0, right: 30)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    var viewModel: ProductDetailsViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        bind()
    }
    
    private func configuration() {
        viewModel = ProductDetailsVIewModel()
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhoneCollectionCell.self, forCellWithReuseIdentifier: "PhoneCollectionCell")
        view.addSubview(mainView)
        view.backgroundColor = .white
        title = "Product Details"
        addBackButton(image: UIImage(named: "BackImage")!)
        addCustomRightButton(image: UIImage(named: "Cart")!)
        setupConstraints()
    }
    
    private func bind() {
        viewModel?.detailData.bind({ [weak self] data in
            guard let data = data else {return}
            self?.imageURLs = data.images
            let charlabels = [data.CPU, data.camera, data.sd, data.ssd]
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
                self?.mainView.setupData(title: data.title, charLabels: charlabels, colors: data.color, capacity: data.capacity, price: data.price, rating: data.rating)
            }
        })
    }
    
    private func setupConstraints() {
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        let height = (view.bounds.size.height - mainView.bounds.size.height) + 40
        collectionView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
}

extension ProductDetails: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhoneCollectionCell", for: indexPath) as! PhoneCollectionCell
        let model = imageURLs[indexPath.row]
        viewModel?.loadDataImage(url: model, completion: { data in
            guard let data = data else { return }
            cell.setImage(image: UIImage(data: data)!)
        })
        return cell
    }
}

extension ProductDetails: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.bounds.size.height - mainView.bounds.size.height) - 15
        let width = view.bounds.size.width - 50
        return CGSize(width: width , height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
}
