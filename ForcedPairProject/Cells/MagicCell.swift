//
//  MagicCell.swift
//  ForcedPairProject
//
//  Created by Alfredo Barragan on 1/9/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class MagicCell: UICollectionViewCell {
    
    @IBOutlet weak var magicImageView: UIImageView!
    
    override func prepareForReuse() {
        magicImageView.image = nil
    }
}
