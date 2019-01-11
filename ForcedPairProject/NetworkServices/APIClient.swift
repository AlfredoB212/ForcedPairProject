//
//  APIClient.swift
//  ForcedPairProject
//
//  Created by Alfredo Barragan on 1/9/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import Foundation

final class APIClient {
    static func getMagicCard(completionHandler: @escaping (AppError?, [MagicCardInfo]?) -> Void) {
        let getEndPointMagic = "https://api.magicthegathering.io/v1/cards?contains=imageUrl"
        NetworkHelper.shared.performDataTask(endpointURLString: getEndPointMagic) { (appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
//            guard let response = httpResponse,
//                (200...299).contains(response.statusCode) else {
//                    let statusCode = httpResponse?.statusCode ?? -999
//                    completionHandler(AppError.badStatusCode(String(statusCode)), nil)
//                    return
//            }
            if let data = data {
                do {
                 let magicData = try JSONDecoder().decode(MagicCards.self, from: data)
                    completionHandler(nil, magicData.cards)
                } catch {
                    completionHandler(AppError.decodingError(error),nil)
                }
            }
        }
    }
    
    static func getPokemonCard(completionHandler: @escaping (AppError?, [PokemonCardInfo]?) -> Void) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.pokemontcg.io/v1/cards?contains=imageUrl,imageUrlHiRes,attacks") { (appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
//            guard let response = httpResponse,
//                (200...).contains(response.statusCode) else {
//                    let statusCode = httpResponse?.statusCode ?? -999
//                    completionHandler(AppError.badStatusCode(String(statusCode)), nil)
//                    return
//            }
            if let data = data {
                do {
                    let pokemonData = try JSONDecoder().decode(PokemonCards.self, from: data)
                    completionHandler(nil, pokemonData.cards)
                } catch {
                    completionHandler(AppError.decodingError(error),nil)
                }
            }
        }
    }
}
