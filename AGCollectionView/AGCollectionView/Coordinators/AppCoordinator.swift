//
//  AppCoordinator.swift
//  AGCollectionView
//
//  Created by Angelo Giurano on 19/09/2018.
//  Copyright © 2018 Angelo Giurano. All rights reserved.
//

import UIKit
import RxSwift

final class AppCoordinator: BaseCoordinator<Void> {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<CoordinationResult> {
        let collectionCoordinator = CollectionCoordinator(with: window)
        return coordinate(to: collectionCoordinator)
    }
}
