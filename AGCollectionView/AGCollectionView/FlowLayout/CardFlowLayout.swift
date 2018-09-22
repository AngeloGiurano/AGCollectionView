//
//  CardFlowLayout.swift
//  AGCollectionView
//
//  Created by Angelo Giurano on 22/09/2018.
//  Copyright © 2018 Angelo Giurano. All rights reserved.
//

import UIKit

final class CardFlowLayout: BaseFlowLayout {
    override func setupFlowLayout() {
        scrollDirection = .horizontal
        sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        minimumInteritemSpacing = 10
        minimumLineSpacing = 10
        itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}
