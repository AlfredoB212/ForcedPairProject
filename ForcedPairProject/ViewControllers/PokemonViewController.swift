//
//  PokemonViewController.swift
//  ForcedPairProject
//
//  Created by Alfredo Barragan on 1/9/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    private var pokemonCards = [PokemonCardInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.pokemonCollectionView.reloadData()
            }
        }
    }
//    private var filteredImages = [PokemonCardInfo]()
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // dump(pokemonCards)
        loadData()
        pokemonCollectionView.dataSource = self
        pokemonCollectionView.delegate = self
        
    }
    func loadData() {
//
                APIClient.getPokemonCard { (appError, pokemonCards) in
                    if let appError = appError {
                        print(appError.errorMessage())
                    } else if let pokemonCards = pokemonCards {
                        self.pokemonCards = pokemonCards
                        dump(pokemonCards)
                    }
                }
            }
    
    }


extension PokemonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as? PokemonCell else { return UICollectionViewCell()}
        let pokemonToSet = pokemonCards[indexPath.row]
        
        
        cell.setUpImage(pokemon: pokemonToSet)
        
        
//        if let imageUrl = imageToSet.imageUrl {
//            urlString = imageUrl.absoluteString
//            if let image = ImageHelper.shared.image(forKey: imageUrl.absoluteString as NSString) {
//                cell.pokemonImageView.image = image
//            } else {
//                ImageHelper.shared.fetchImage(urlString: imageUrl.absoluteString) { (appError, image) in
//                    if let appError = appError {
//                        print(appError.errorMessage())
//                    } else if let image = image {
//                        cell.pokemonImageView.image = image
//                    }
//                }
//
//            }
//        }
    
 return cell
    }
}


extension PokemonViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 100, height: 150)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc =
            storyboard.instantiateViewController(withIdentifier: "PokemonDetailViewController") as? PokemonDetailViewController else {return}
        
        vc.modalPresentationStyle = .overCurrentContext
        vc.pokemonCard = pokemonCards[indexPath.row]
        // makes it segue
        present(vc, animated: true, completion: nil)
    }
    
    
}
