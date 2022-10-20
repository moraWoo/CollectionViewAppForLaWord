//
//  FooterCollectionReusableView.swift
//  CollectionView2
//
//  Created by Ildar Khabibullin on 19.10.2022.
//

import UIKit

class FooterCollectionReusableView: UICollectionReusableView {
    static let identifier = "FooterCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "footer"
        label.textColor = .white
        return label
    }()
    
    public func configure() {
        backgroundColor = .systemBlue
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}

