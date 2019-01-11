//
//  ViewController.swift
//  ForcedPairProject
//
//  Created by Alfredo Barragan on 1/9/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class MagicViewController: UIViewController {
    @IBOutlet weak var magicCollectionView: UICollectionView!
    private var magicCards = [MagicCardInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.magicCollectionView.reloadData()
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        magicCollectionView.dataSource = self

    }
    
    
}

extension MagicViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return magicCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MagicCell", for: indexPath) as? MagicCell else { return UICollectionViewCell()}
        
      //  guard let url = URL.init(string: magicCards[indexPath.row]) else { return UICollectionViewCell() }
        //URLSession.shared.dataTask(with: url)
        return cell
    }
    
    
}
