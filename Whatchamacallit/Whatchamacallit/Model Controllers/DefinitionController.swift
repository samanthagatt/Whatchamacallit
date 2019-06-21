//
//  DefinitionController.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/21/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import Foundation

class DefinitionController {
    
    func getRandomWordWithDefinition(definitionLimit: Int = 15, definitionSource: WordnikEnum.DefinitionSources = .all, completion: @escaping ([Definition]?, NetworkManager.NetworkError?) -> Void) {
        let paths = [WordnikString.wordsJSON, WordnikString.randomWord]
        let queries = [WordnikString.hasDefinition: String(true), WordnikString.apiKey: apiKey]
        NetworkManager.makeRequest(baseURLString: WordnikString.baseURL, appendingPaths: paths, queries: queries) { (word: Word?, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let wordName = word?.word else {
                completion(nil, .apiError(error: WordnikError.noWordReturned))
                return
            }
            let paths = [WordnikString.wordJSON, wordName, WordnikString.definitions]
            let queries = [WordnikString.limit: String(definitionLimit),
                           WordnikString.sources: definitionSource.rawValue,
                           WordnikString.apiKey: apiKey]
            NetworkManager.makeRequest(baseURLString: WordnikString.baseURL, appendingPaths: paths, queries: queries, completion: completion)
        }
    }
}
