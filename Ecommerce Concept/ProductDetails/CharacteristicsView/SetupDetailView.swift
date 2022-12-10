//
//  SetupDetailView.swift
//  Ecommerce Concept
//
//  Created by Гарик on 07.12.2022.
//

import UIKit
import Cosmos

class SetupDetailView: UIView {
    
    let arraySection = ["Shop", "Details", "Features"]
    var characteristics: [UIStackView] = []
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "MarkPro", size: 23)
        return label
    }()
    
    private lazy var favoritesView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0, blue: 0.2078431373, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 11
        let image = UIImageView(image: UIImage(named: "Favorites"))
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    private lazy var ratingView: CosmosView = {
        let view = CosmosView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.settings.updateOnTouch = false
        view.settings.filledColor = #colorLiteral(red: 1, green: 0.7650542855, blue: 0, alpha: 1)
        view.settings.emptyColor = .lightGray
        view.settings.fillMode = .precise
        return view
    }()
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isScrollEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private lazy var characteristicsPicture: UIImageView = createCharacteristicImageView(image: UIImage(named: "CPU")!)
    private lazy var characteristicsPicture2: UIImageView = createCharacteristicImageView(image: UIImage(named: "Camera")!)
    private lazy var characteristicsPicture3: UIImageView = createCharacteristicImageView(image: UIImage(named: "SD")!)
    private lazy var characteristicsPicture4: UIImageView = createCharacteristicImageView(image: UIImage(named: "SSD")!)
    
    private lazy var characteristicsLabel: UILabel = createCharacteristicLabel(text: "")
    private lazy var characteristicsLabel2: UILabel = createCharacteristicLabel(text: "")
    private lazy var characteristicsLabel3: UILabel = createCharacteristicLabel(text: "")
    private lazy var characteristicsLabel4: UILabel = createCharacteristicLabel(text: "")
    
    private lazy var characteristicsStackView: UIStackView = addStackView(view1: characteristicsPicture, view2: characteristicsLabel)
    private lazy var characteristicsStackView2: UIStackView = addStackView(view1: characteristicsPicture2, view2: characteristicsLabel2)
    private lazy var characteristicsStackView3: UIStackView = addStackView(view1: characteristicsPicture3, view2: characteristicsLabel3)
    private lazy var characteristicsStackView4: UIStackView = addStackView(view1: characteristicsPicture4, view2: characteristicsLabel4)
    
    private lazy var mainCharacteristicsStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 30
        view.distribution = .fillEqually
        view.addArrangedSubview(characteristicsStackView)
        view.addArrangedSubview(characteristicsStackView2)
        view.addArrangedSubview(characteristicsStackView3)
        view.addArrangedSubview(characteristicsStackView4)
        return view
    }()
    
    private lazy var selectColorLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.text = "Select color and capacity"
        view.font = UIFont(name: "MarkPro", size: 16)
        view.textAlignment = .left
        return view
    }()
    
    
    private lazy var colorView: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 17.5
        view.changesSelectionAsPrimaryAction = true
        view.addTarget(self, action: #selector(tapColorView), for: .touchUpInside)
        return view
    }()
    
    private lazy var colorView2: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 17.5
        view.changesSelectionAsPrimaryAction = true
        view.addTarget(self, action: #selector(tapColorView), for: .touchUpInside)
        return view
    }()
    
    private lazy var GBView: UIButton = {
        let view = UIButton()
        view.tag = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 13)
        view.titleLabel?.alpha = 0.6
        view.layer.cornerRadius = 11
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(tapGB), for: .touchUpInside)
        return view
    }()
    
    private lazy var GBView2: UIButton = {
        let view = UIButton()
        view.tag = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 13)
        view.titleLabel?.alpha = 0.6
        view.layer.cornerRadius = 11
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(tapGB), for: .touchUpInside)
        return view
    }()
    
    private lazy var selectColorStacView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 15
        view.alignment = .center
        view.addArrangedSubview(colorView)
        view.addArrangedSubview(colorView2)
        return view
    }()
    
    
    private lazy var selectGBStacView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 15
        view.addArrangedSubview(GBView)
        view.addArrangedSubview(GBView2)
        return view
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor  = .white
        label.font = UIFont(name: "MarkPro-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    var labelAddtoCart: UILabel = {
        let label = UILabel()
        label.text = "Add to Cart"
        label.textColor  = .white
        label.font = UIFont(name: "MarkPro-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private lazy var addToCartButton: UIButton = {
        let view = UIButton()
        view.addSubview(priceLabel)
        view.addSubview(labelAddtoCart)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 0.5189241767, blue: 0.3763272166, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createCharacteristicImageView(image: UIImage) -> UIImageView {
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFit
        view.maximumContentSizeCategory = .unspecified
        return view
    }
    
    private func createCharacteristicLabel(text: String) -> UILabel {
        let view = UILabel()
        view.text = text
        view.textColor = .black
        view.alpha = 0.5
        view.font = UIFont(name: "MarkPro", size: 10)
        view.textAlignment = .center
        return view
    }
    
    private func addStackView(view1: UIView, view2: UIView) -> UIStackView {
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.spacing = 5
        view.axis = .vertical
        view.alignment = .center
        view.addArrangedSubview(view1)
        view.addArrangedSubview(view2)
        return view
    }
    
    private func configuration() {
        collectionView.register(MainSelectionColectionVIewCell.self, forCellWithReuseIdentifier: "MainSelectionColectionVIewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        let arrayViews = [favoritesView, title, ratingView, collectionView, mainCharacteristicsStackView, selectColorLabel, selectColorStacView, selectGBStacView, addToCartButton]
        arrayViews.forEach { view in
            addSubview(view)
        }
    }
    
    @objc func tapGB() {
        if GBView.isHighlighted {
            GBView.backgroundColor = #colorLiteral(red: 1, green: 0.5189241767, blue: 0.3763272166, alpha: 1)
            GBView.setTitleColor(.white, for: .normal)
            GBView.titleLabel?.alpha = 1
            GBView2.backgroundColor = .white
            GBView2.titleLabel?.alpha = 0.6
            GBView2.setTitleColor(.black, for: .normal)
        } else {
            GBView2.backgroundColor = #colorLiteral(red: 1, green: 0.5189241767, blue: 0.3763272166, alpha: 1)
            GBView2.titleLabel?.alpha = 1
            GBView2.setTitleColor(.white, for: .normal)
            GBView.titleLabel?.alpha = 0.6
            GBView.backgroundColor = .white
            GBView.setTitleColor(.black, for: .normal)
        }
    }
    
    func setupData(title: String, charLabels: [String], colors: [String], capacity: [String], price: Int, rating: Double) {
        self.title.text = title
        self.characteristicsLabel.text = charLabels[0]
        self.characteristicsLabel2.text = charLabels[1]
        self.characteristicsLabel3.text = charLabels[2]
        self.characteristicsLabel4.text = charLabels[3]
        self.colorView.backgroundColor = UIColor.colorFromRGB(colors[0])
        self.colorView2.backgroundColor = UIColor.colorFromRGB(colors[1])
        self.GBView.setTitle("\(capacity[0]) GB", for: .normal)
        self.GBView2.setTitle("\(capacity[1]) GB", for: .normal)
        self.priceLabel.text = "$\(price).00"
        self.ratingView.rating = rating
    }
    
    @objc func tapColorView() {
        if colorView.isHighlighted {
            colorView2.setImage(nil, for: .normal)
            colorView.setImage(UIImage(named: "CheckMark"), for: .normal)
        } else {
            colorView.setImage(nil, for: .normal)
            colorView2.setImage(UIImage(named: "CheckMark"), for: .normal)
        }
    }
    
    private func setupConstraints() {
        
        priceLabel.trailingAnchor.constraint(equalTo: addToCartButton.trailingAnchor,constant: -30).isActive = true
        priceLabel.topAnchor.constraint(equalTo: addToCartButton.topAnchor,constant: 10).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: addToCartButton.bottomAnchor,constant: -10).isActive = true
        
        
        labelAddtoCart.leadingAnchor.constraint(equalTo: addToCartButton.leadingAnchor,constant: 30).isActive = true
        labelAddtoCart.topAnchor.constraint(equalTo: addToCartButton.topAnchor,constant: 10).isActive = true
        labelAddtoCart.bottomAnchor.constraint(equalTo: addToCartButton.bottomAnchor,constant: -10).isActive = true
        
        favoritesView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35).isActive = true
        favoritesView.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        favoritesView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        favoritesView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35).isActive = true
        title.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        title.trailingAnchor.constraint(equalTo: favoritesView.leadingAnchor, constant: -10).isActive = true
        
        ratingView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5).isActive = true
        ratingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35).isActive = true
        
        
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35).isActive = true
        collectionView.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 15).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        colorView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        colorView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        colorView2.widthAnchor.constraint(equalToConstant: 35).isActive = true
        colorView2.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        GBView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        GBView2.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        mainCharacteristicsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35).isActive = true
        mainCharacteristicsStackView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 25).isActive = true
        mainCharacteristicsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35).isActive = true
        
        selectColorLabel.topAnchor.constraint(equalTo: mainCharacteristicsStackView.bottomAnchor, constant: 20).isActive = true
        selectColorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35).isActive = true
        
        selectColorStacView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35).isActive = true
        selectColorStacView.topAnchor.constraint(equalTo: selectColorLabel.bottomAnchor, constant: 10).isActive = true
        
        selectGBStacView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -55).isActive = true
        selectGBStacView.centerYAnchor.constraint(equalTo: selectColorStacView.centerYAnchor).isActive = true
        
        addToCartButton.topAnchor.constraint(equalTo: selectColorStacView.bottomAnchor, constant: 15).isActive = true
        addToCartButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35).isActive = true
        addToCartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35).isActive = true
        addToCartButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

extension SetupDetailView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arraySection.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainSelectionColectionVIewCell", for: indexPath) as! MainSelectionColectionVIewCell
        cell.setTitle(title: arraySection[indexPath.row])
        collectionView.selectItem(at: [0, 0], animated: true, scrollPosition: .centeredHorizontally)
        if indexPath.row == 0 {
            cell.isOnLineView()
        }
        return cell
    }
}


extension SetupDetailView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (bounds.width - 90) / 3, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MainSelectionColectionVIewCell
        cell.isOnLineView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MainSelectionColectionVIewCell
        if ((collectionView.indexPathsForSelectedItems?.contains(indexPath)) != nil)  {
            cell.isOffLineView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}
