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
    private var filteredImages = [MagicCardInfo]()
    private var magicCards = [MagicCardInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.magicCollectionView.reloadData()
                self.filteredImages = self.magicCards.filter {$0.imageUrl != nil}
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        magicCollectionView.dataSource = self
        magicCollectionView.delegate = self
        APIClient.getMagicCard { (appError, magicCards) in
            if let appError = appError{
                print(appError.errorMessage())
            } else if let magicCards = magicCards{
                self.magicCards = magicCards
            }
        }
    }
    

    
    
}

extension MagicViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MagicCell", for: indexPath) as? MagicCell else { return UICollectionViewCell()}
        let magicToSet = magicCards[indexPath.row]
        let imageToSet = filteredImages[indexPath.row]
        var urlString = ""
        if let imageUrl = imageToSet.imageUrl{
            urlString = imageUrl.absoluteString
            if let image = ImageHelper.shared.image(forKey: imageUrl.absoluteString as NSString) {
                cell.magicImageView.image = image
            } else {
                
                ImageHelper.shared.fetchImage(urlString: imageUrl.absoluteString) { (appError, image) in
                    if let appError = appError {
                        print(appError.errorMessage())
                    } else if let image = image {
                        if urlString == imageUrl.absoluteString {
                            cell.magicImageView.image = image
                        }
                    }
                    
                }
            }
        }
            return cell
    }
    
    
}

extension MagicViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: 125, height: 175)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "MagicDetailViewController") as? MagicDetailViewController else { return }
            vc.modalPresentationStyle = .overCurrentContext
            vc.magicCards = magicCards[indexPath.row]
            present(vc, animated: true, completion: nil)
        }
    }

    

