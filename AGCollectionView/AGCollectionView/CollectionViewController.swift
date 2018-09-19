//
//  CollectionViewController.swift
//  AGCollectionView
//
//  Created by Angelo Giurano on 19/09/2018.
//  Copyright © 2018 Angelo Giurano. All rights reserved.
//

import UIKit
import SnapKit

typealias ConstraintMakerType = (ConstraintMaker) -> Void

final class CollectionViewController: UIViewController {
    
    private let collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        drawView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Make sure navigation bar is hidden if the controller is presented on a navigation controller
        self.navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func drawView() {
        createCollectionView { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func createCollectionView(with constraints: ConstraintMakerType) {
        //Create and add the main collection view as a subview
        collectionView = UICollectionView(frame: view.frame)
        view.addSubview(collectionView)
    }
}

