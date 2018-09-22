//
//  CollectionViewController.swift
//  AGCollectionView
//
//  Created by Angelo Giurano on 19/09/2018.
//  Copyright © 2018 Angelo Giurano. All rights reserved.
//

import UIKit

final class CollectionViewController: UIViewController, BindableType {

    var viewModel: CollectionViewViewModel!
    private var collectionView: UICollectionView!
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        drawView()
        bindViewModel()
        // Do any additional setup after loading the view, typically from a nib.
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
    
    func bindViewModel() {
    }

}

extension CollectionViewController {
    private func createCollectionView(with constraints: ConstraintMakerType) {
        collectionView = UICollectionView(frame: view.frame)
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { constraints($0) }
    }
}

