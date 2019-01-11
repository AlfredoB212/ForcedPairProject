//
//  PokemonDetailViewController.swift
//  ForcedPairProject
//
//  Created by Alfredo Barragan on 1/9/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    var pokemonCard: PokemonCardInfo!
    
    @IBOutlet weak var pokemonDetailCollectionView: UICollectionView!
    @IBOutlet weak var buttonProperty: UIButton!
    @IBAction func buttonPressjed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
   
    
    @IBOutlet weak var pokemonDetailImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonDetailCollectionView.delegate = self
        pokemonDetailCollectionView.isPagingEnabled = true
        pokemonDetailCollectionView.dataSource = self
    getPokemonImage()
        print(pokemonCard)
        buttonProperty.alpha = 0.6
        
    }
 
    func getPokemonImage() {
        ImageHelper.shared.fetchImage(urlString: pokemonCard.imageUrlHiRes ?? "") { (appError, image) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let image = image {
                self.pokemonDetailImage.image = image
            }
        }
    }
}

extension PokemonDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonCard.attacks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonDetailCell", for: indexPath) as? PokemonDetailCell else { return UICollectionViewCell()}
       // guard let
        let pokemonToSet = pokemonCard.attacks[indexPath.row]
        cell.pokemonDetailAttackName.text = pokemonToSet.name
        cell.pokemonDetailAttackDamage.text = pokemonToSet.damage
        cell.pokemonDetailDescription.text = pokemonToSet.text
        if pokemonToSet.text == "" {
            cell.pokemonDetailDescription.isHidden = true
        }
//        guard case let pokemonToSet.text != nil else   { return cell.pokemonDetailDescription.isHidden = true
//        }
        return cell
    
    }
    
    
}
extension PokemonDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }}

