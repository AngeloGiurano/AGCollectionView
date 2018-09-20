//
//  ViewModelType.swift
//  AGCollectionView
//
//  Created by Angelo Giurano on 20/09/2018.
//  Copyright © 2018 Angelo Giurano. All rights reserved.
//

import Foundation

protocol ViewModelType {
    //Used to define all inputs in a viewmodel and bind controls
    associatedtype Input
    //Used to react over inputs and data changes and bind it to ui
    associatedtype Output
}
