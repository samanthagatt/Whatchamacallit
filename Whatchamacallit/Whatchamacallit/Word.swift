//
//  Word.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/20/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import Foundation

struct Word: Decodable {
    var canonicalForm: String?
    var id: Int?
    var originalWord: String?
    var suggestions: [String]?
    var vulgar: String?
    var word: String?
}
