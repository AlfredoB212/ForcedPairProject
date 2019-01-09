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
    
    override func prepareForReuse() {
        pokemonImageView.image = nil
    }
}
