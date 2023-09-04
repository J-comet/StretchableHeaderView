//
//  TestCollectionReusableView.swift
//  StretchableHeaderView
//
//  Created by 장혜성 on 2023/09/04.
//

import UIKit

class TestCollectionReusableView: UICollectionReusableView {
    static let identifier = "TestCollectionReusableView"
    
    let imageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configView() {
        imageView.image = UIImage(named: "겨울왕국2")
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
