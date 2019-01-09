//
//  MagicModel.swift
//  ForcedPairProject
//
//  Created by Alfredo Barragan on 1/9/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import Foundation


struct MagicCards: Codable {
    let cards: [MagicCardInfo]
}

struct MagicCardInfo: Codable {
    let name: String
    let imageUrl: String
    let text: String
}
