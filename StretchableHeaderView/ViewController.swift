//
//  ViewController.swift
//  StretchableHeaderView
//
//  Created by 장혜성 on 2023/09/04.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var collectionView = {
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: self.collectionViewLayout()
        )
//        view.showsVerticalScrollIndicator = false
        view.register(TestCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TestCollectionReusableView.identifier)
        view.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: TestCollectionViewCell.identifier)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = StretchableUICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let count: CGFloat = 3
        let width: CGFloat = UIScreen.main.bounds.width - (spacing * (count + 1))
        
        layout.itemSize = CGSize(width: width / count, height: (width / count))
        layout.sectionInset = UIEdgeInsets(top: 20, left: spacing, bottom: 20, right: spacing)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        
        // 헤더 높이
        layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 300)
        return layout
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TestCollectionViewCell.identifier, for: indexPath) as! TestCollectionViewCell
        
        cell.backgroundColor = .brown
        cell.layer.cornerRadius = 10.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TestCollectionReusableView.identifier, for: indexPath) as? TestCollectionReusableView else {
                fatalError("Invalid view type")
            }
            return headerView
        default:
            assert(false, "Invalid element type")
        }
    }
    
}

