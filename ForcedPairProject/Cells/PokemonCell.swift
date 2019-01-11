//
//  PokemonCell.swift
//  ForcedPairProject
//
//  Created by Alfredo Barragan on 1/9/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    @IBOutlet weak var pokemonImageView: UIImageView!
        
    func setUpImage(pokemon: PokemonCardInfo) {
        ImageHelper.shared.fetchImage(urlString: pokemon.imageUrl ?? "") { (appError, image) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let image = image {
                self.pokemonImageView.image = image
            }
        }
    }
    
    override func prepareForReuse() {
        pokemonImageView.image = nil
    }
}
