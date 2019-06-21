//
//  Definition.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/20/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import Foundation

struct Definition: Decodable {
    var id: String?
    var word: String?
    var text: String?
    
    var attributedText: NSAttributedString? {
        guard let text = self.text else { return nil }
        let data = text.data(using: .unicode, allowLossyConversion: true) ?? Data()
        return try? NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
    }
}
