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
        sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        minimumInteritemSpacing = 20
        minimumLineSpacing = 20
        itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height)
    }
}
