//
//  BaseFlowLayout.swift
//  AGCollectionView
//
//  Created by Angelo Giurano on 22/09/2018.
//  Copyright © 2018 Angelo Giurano. All rights reserved.
//

import UIKit

protocol FlowLayoutSetup {
    func setupFlowLayout()
}

class BaseFlowLayout : UICollectionViewFlowLayout, FlowLayoutSetup {
    func setupFlowLayout() {
        fatalError("Override me (& don't user super)!")
    }
    
    // MARK: - Initializators
    override init() {
        super.init()
        self.setupFlowLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupFlowLayout()
    }
}

