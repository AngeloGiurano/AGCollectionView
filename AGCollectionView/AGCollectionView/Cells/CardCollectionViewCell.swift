//
//  CardCollectionViewCell.swift
//  AGCollectionView
//
//  Created by Angelo Giurano on 22/09/2018.
//  Copyright © 2018 Angelo Giurano. All rights reserved.
//

import UIKit

final class CardCollectionViewCell: UICollectionViewCell {
    
    static var reusableIdentifier: String {
        get { return "cardCollectionViewCell" }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawView() {
        self.backgroundColor = UIColor.red
    }
}
