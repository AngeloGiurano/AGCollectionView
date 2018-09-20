//
//  CollectionViewDataSource.swift
//  AGCollectionView
//
//  Created by Angelo Giurano on 20/09/2018.
//  Copyright © 2018 Angelo Giurano. All rights reserved.
//

import Foundation
import RxDataSources
import RxSwift
import UIKit


struct PostViewModel {
    var uuid = UUID()
}

enum CardType: IdentifiableType, Equatable {
    
    var identity: String { return UUID().uuidString }
    typealias Identity = String
    
    case initial
    case post(PostViewModel)
    case final
    
    static func ==(lhs: CardType, rhs: CardType) -> Bool {
        switch (lhs, rhs) {
        case (let .post(viewModel1), let .post(viewModel2)):
            return viewModel1.uuid == viewModel2.uuid
        case (.initial, .initial):
            return true
        case (.final, .final):
            return true
        default:
            return false
        }
    }
}

struct CollectionViewSection: AnimatableSectionModelType {
    
    var identity: String { return header }
    typealias Identity = String
    
    var items: [CardType]
    var header: String
    
    init(original: CollectionViewSection, items: [CardType]) {
        self.header = ""
        self.items = items
    }
    
    init(header: String, items: [CardType]) {
        self.header = header
        self.items = items
    }
    
    typealias Item = CardType
}

final class CollectionViewDataSource: RxCollectionViewSectionedReloadDataSource<CollectionViewSection> {
    
//    private(set) var cards: Observable<[CardType]>
//      private(set) var sections: Observable<[CollectionViewSection]>
    
    private let _reload: PublishSubject<Void> = PublishSubject()
    private let disposeBag = DisposeBag()
    
    init() {
        // Set cell
        let configureCell : ConfigureCell = { (dataSource, collection, indexPath, model) -> UICollectionViewCell in
            return UICollectionViewCell()
        }
        
        super.init(
            configureCell: configureCell
        )
    }
    
    func reload() {
        _reload.onNext(())
    }
}

