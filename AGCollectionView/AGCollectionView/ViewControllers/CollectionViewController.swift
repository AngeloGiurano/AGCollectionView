//
//  CollectionViewController.swift
//  AGCollectionView
//
//  Created by Angelo Giurano on 19/09/2018.
//  Copyright © 2018 Angelo Giurano. All rights reserved.
//

import UIKit
import RxSwift

final class CollectionViewController: UIViewController, BindableType {

    var viewModel: CollectionViewViewModel!
    private var collectionView: UICollectionView!
    private var progressBar: UIProgressView!
    private let disposeBag = DisposeBag()
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(-5)
            make.right.equalToSuperview().offset(5)
            make.bottom.equalToSuperview()
        }
        
        createProgressBar { (make) in
            make.bottom.equalToSuperview().offset(-42)
            make.left.equalToSuperview().offset(28)
            make.right.equalToSuperview().offset(-28)
            make.height.equalTo(4)
        }
    }
    
    func bindViewModel() {
        viewModel.output.collectionViewDataSource
        .sections
        .asDriver(onErrorJustReturn: [])
        .drive(collectionView.rx.items(dataSource: viewModel.output.collectionViewDataSource))
        .disposed(by: disposeBag)
        
        collectionView.rx
        .willDisplayCell
        .subscribe(onNext: { [unowned self] _, indexPath in
            let index = indexPath.row + 1
            let items = self.collectionView.numberOfItems(inSection: 0)
            let ratio = Float(index)/Float(items)
            self.progressBar.setProgress(ratio, animated: true)
        })
        .disposed(by: disposeBag)
        
        collectionView.rx
        .didEndDecelerating
        .subscribe(onNext: { [unowned self] (_) in
            guard let cell = self.collectionView.visibleCells.first,
                let indexPath = self.collectionView.indexPath(for: cell) else { return }
            let index = indexPath.row + 1
            let items = self.collectionView.numberOfItems(inSection: 0)
            let ratio = Float(index)/Float(items)
            self.progressBar.setProgress(ratio, animated: true)
        })
        .disposed(by: disposeBag)
    }

}

extension CollectionViewController {
    private func createCollectionView(with constraints: ConstraintMakerType) {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: CardFlowLayout())
        view.addSubview(collectionView)
        collectionView.isPagingEnabled = true
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.reusableIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.snp.makeConstraints { constraints($0) }
    }
    
    private func createProgressBar(with constraints: ConstraintMakerType) {
        progressBar = UIProgressView(progressViewStyle: UIProgressViewStyle.bar)
        view.addSubview(progressBar)
        progressBar.trackTintColor = UIColor(netHex: 0x595959)
        progressBar.tintColor = UIColor.white
        view.addSubview(progressBar)
        progressBar.clipsToBounds = true
        progressBar.layer.masksToBounds = true
        progressBar.layer.cornerRadius = 2
        progressBar.snp.makeConstraints { constraints($0) }
    }
}

