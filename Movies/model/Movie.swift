//
//  Movie.swift
//  Movies
//
//  Created by Remon Gerges Shehata on 1/3/20.
//  Copyright © 2020 Remon Gerges Shehata. All rights reserved.
//

import Foundation

class Movie {
    static var moviesArr = [Movie]()
    
    var filePath : String
    var movieTitle : String
    var Id : Int
    
    init(filePath : String, title : String, id : Int) {
        self.filePath = filePath
        self.movieTitle = title
        self.Id = id
    }
}
