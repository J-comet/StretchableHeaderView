//
//  TestCollectionViewCell.swift
//  StretchableHeaderView
//
//  Created by 장혜성 on 2023/09/04.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TestCollectionViewCell"
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
