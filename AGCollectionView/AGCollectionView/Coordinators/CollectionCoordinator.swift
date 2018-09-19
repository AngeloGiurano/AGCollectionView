//
//  CollectionCoordinator.swift
//  AGCollectionView
//
//  Created by Angelo Giurano on 19/09/2018.
//  Copyright © 2018 Angelo Giurano. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

final class CollectionCoordinator: BaseCoordinator<Void> {
    
    private let window: UIWindow
    
    init(with window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let rootViewController = UIViewController()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        return Observable.never()
    }
}
