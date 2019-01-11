//
//  PokemonModel.swift
//  ForcedPairProject
//
//  Created by Alfredo Barragan on 1/9/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import Foundation
struct PokemonCards: Codable {
    let cards: [PokemonCardInfo]
}

struct PokemonCardInfo: Codable {
    let attacks: [AttackInfo]
    let imageUrl: String?
    let imageUrlHiRes: String?
}

struct AttackInfo: Codable {
    let name: String
    let text: String?
    let damage: String
}


