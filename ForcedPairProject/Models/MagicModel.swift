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
    let foreignNames: [ForeignNames]
    let imageUrl: URL?
}

struct ForeignNames: Codable {
    let name: String
    let text: String
    let language: String
    let imageUrl: String
}
