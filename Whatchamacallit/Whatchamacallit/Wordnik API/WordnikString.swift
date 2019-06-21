//
//  WordnikStrings.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/20/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import Foundation

enum WordnikString {
    
    // Main
    static let baseURL = "https://api.wordnik.com/v4"
    static let apiKey = "api_key"
    
    // Getting random word
    static let wordsJSON = "words.json"
    static let randomWord = "randomWord"
    
    // Getting definition of word
    static let wordJSON = "word.json"
    static let hasDefinition = "hasDictionaryDef"
    static let definitions = "definitions"
    static let limit = "limit"
    static let sources = "sourceDictionaries"
}
