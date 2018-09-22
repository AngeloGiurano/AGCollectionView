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
    
    struct Output {
        var collectionViewDataSource: CollectionViewDataSource
    }
    
    init() {
        input = Input()
        
        let posts = [PostViewModel(), PostViewModel(), PostViewModel(), PostViewModel()]
        output = Output(
            collectionViewDataSource: CollectionViewDataSource(with: posts)
        )
    }
}
