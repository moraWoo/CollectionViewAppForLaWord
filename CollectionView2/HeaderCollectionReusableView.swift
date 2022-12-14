//
//  HeaderCollectionReusableView.swift
//  CollectionView2
//
//  Created by Ildar Khabibullin on 19.10.2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    public func configure(_ labelOfSection: String) {
//        backgroundColor = .systemRed
        label.text = labelOfSection
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}

