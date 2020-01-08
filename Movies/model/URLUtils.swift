//
//  URLUtils.swift
//  Movies
//
//  Created by Remon Gerges Shehata on 1/4/20.
//  Copyright © 2020 Remon Gerges Shehata. All rights reserved.
//

import Foundation

class URLUtils
{
    static let API_KEY = "a095ac34f9f5d48078be553f1c54f9cc"
    static let baseURL = "http://image.tmdb.org/t/p/"
    static let imageSize = "w185"
    
    static func getImageFullURL(posterPath: String) -> URL {
        let stringURL = baseURL + imageSize + posterPath
        
        //print(stringURL)
        let imageURL = URL(string: stringURL)
        
        return imageURL!
    }
    
    static func getPopularMoviesURL() -> URL {
        let popularMoviesStringURL = "https://api.themoviedb.org/3/movie/popular?api_key=\(URLUtils.API_KEY)&language=en-US&page=1"
        return URL(string: popularMoviesStringURL)!
    }
}
    
