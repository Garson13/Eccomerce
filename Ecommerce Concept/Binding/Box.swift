//
//  Box.swift
//  Ecommerce Concept
//
//  Created by Гарик on 03.12.2022.
//

import Foundation


class Box<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?

    func bind(_ listener: Listener?) {
        self.listener = listener
    }

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ v: T) {
        value = v
    }

}
