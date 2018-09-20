//
//  CollectionViewViewModel.swift
//  AGCollectionView
//
//  Created by Angelo Giurano on 20/09/2018.
//  Copyright © 2018 Angelo Giurano. All rights reserved.
//

import Foundation
import RxSwift

struct CollectionViewViewModel: ViewModelType {
    var input: Input
    var output: Output
    
    struct Input {}
    
    struct Output {}
    
    init() {
        input = Input()
        output = Output()
    }
}
