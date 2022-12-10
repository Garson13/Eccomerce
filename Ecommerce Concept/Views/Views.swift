//
//  Views.swift
//  Ecommerce Concept
//
//  Created by Гарик on 04.12.2022.
//

import UIKit

enum Views {
    static let hotSales: UILabel = {
        let view = UILabel()
        view.text = "Hot sales"
        view.font = UIFont(name: "MarkPro-Bold", size: 25)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static let seeMore: UILabel = {
        let view = UILabel()
        view.text = "see more"
        view.font = UIFont(name: "Mark Pro", size: 15)
        view.textColor = UIColor(named: "FF6E4E")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static let selectCategory: UILabel = {
        let view = UILabel()
        view.text = "Select Category"
        view.font = UIFont(name: "MarkPro-Bold", size: 25)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static let viewAll: UILabel = {
        let view = UILabel()
        view.text = "view all"
        view.font = UIFont(name: "Mark Pro", size: 15)
        view.textColor = UIColor(named: "FF6E4E")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static let searchBar: UISearchBar = {
        let view = UISearchBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "Search"
        view.searchTextField.font = UIFont(name: "MarkPro", size: 12)
        view.searchTextPositionAdjustment = UIOffset(horizontal: 15, vertical: 0)
        view.setPositionAdjustment(UIOffset(horizontal: 12, vertical: 0), for: .search)
        view.searchBarStyle = .minimal
        view.searchTextField.backgroundColor = .white
        view.searchTextField.leftView?.tintColor = UIColor(named: "FF6E4E")
        view.searchTextField.layer.cornerRadius = 19.7
        view.searchTextField.clipsToBounds = true
        view.layer.shadowColor = UIColor(red: 0.656, green: 0.669, blue: 0.788, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize(width: 1, height: 0)
        return view
    }()
    
    static let searchBarQR: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "QR")
        
        return view
    }()
    
    static let searchBarButton: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "FF6E4E")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 17
        return view
    }()
    
    static let bestSeller: UILabel = {
        let view = UILabel()
        view.text = "Best Seller"
        view.font = UIFont(name: "MarkPro-Bold", size: 25)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static let seeMoreBestSeller: UILabel = {
        let view = UILabel()
        view.text = "see more"
        view.font = UIFont(name: "Mark Pro", size: 15)
        view.textColor = UIColor(named: "FF6E4E")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    static let navigationTitleView: UIStackView = {
        let label = UILabel()
        label.text = "Zihuatanejo, Gro"
        label.textColor = .black
        label.font = UIFont(name: "MarkPro", size: 15)
        let chevron = UIImageView(image: UIImage(systemName: "chevron.down"))
        chevron.tintColor = .lightGray
        let location = UIImageView(image: UIImage(named: "location"))
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.spacing = 10
        view.addArrangedSubview(location)
        view.addArrangedSubview(label)
        view.addArrangedSubview(chevron)
        return view
    }()
}


extension UIColor {
    static func colorFromRGB(_ hex: String) -> UIColor? {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
                hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
                let length = hexSanitized.count

                var rgb: UInt64 = 0

                var r: CGFloat = 0.0
                var g: CGFloat = 0.0
                var b: CGFloat = 0.0
                var a: CGFloat = 1.0
                
                guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
                
                if length == 6 {
                    r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
                    g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
                    b = CGFloat(rgb & 0x0000FF) / 255.0
                } else if length == 8 {
                    r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
                    g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
                    b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
                    a = CGFloat(rgb & 0x000000FF) / 255.0
                } else {
                    return nil
                }

        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
