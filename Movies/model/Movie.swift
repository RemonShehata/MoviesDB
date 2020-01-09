//
//  Movie.swift
//  Movies
//
//  Created by Remon Gerges Shehata on 1/3/20.
//  Copyright © 2020 Remon Gerges Shehata. All rights reserved.
//

import Foundation

class Movie {
    var filePath : String
    static var moviesArr = [Movie]()
    
    init(filePath : String) {
        self.filePath = filePath
    }
}
