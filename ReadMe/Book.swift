//
//  Book.swift
//  ReadMe
//
//  Created by Christian Skorobogatow on 20/7/21.
//

import UIKit

struct Book {
    let title: String
    let author: String
    
    var image: UIImage {
        LibrarySymbol.letterSquare(letter: title.first).image
    }
}
