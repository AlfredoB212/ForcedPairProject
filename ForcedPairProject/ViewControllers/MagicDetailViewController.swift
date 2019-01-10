//
//  MagicDetailViewController.swift
//  ForcedPairProject
//
//  Created by Alfredo Barragan on 1/9/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class MagicDetailViewController: UIViewController {

    @IBOutlet weak var magicCollectionView: UICollectionView!
    public var magicCards: MagicCardInfo!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        magicCollectionView.dataSource = self
    }
    
    
    
}

extension MagicDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return magicCards.foreignNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MagicDetailCell", for: indexPath) as? MagicDetailCell else { return UICollectionViewCell() }
        let magicToSet = magicCards.foreignNames[indexPath.row]
        ImageHelper.shared.fetchImage(urlString: magicToSet.imageUrl) { (appError, image) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let image = image {
                cell.magicDetailImage.image = image
            }
        }
        cell.magicDetailName.text = magicToSet.name
        cell.magivDetailLanguage.text = magicToSet.language
        cell.magicDetailDescription.text = magicToSet.text
        return cell
        
    }
}

    


