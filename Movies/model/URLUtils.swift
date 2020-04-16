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
    
    static func getPopularMoviesURL() -> String {
        let popularMoviesStringURL = "https://api.themoviedb.org/3/movie/popular?api_key=\(API_KEY)&language=en-US&page=1"
        return popularMoviesStringURL
    }
    
    static func getTopRatedMoviesURL() -> String {
        let topRatedMoviesStringURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=\(API_KEY)&language=en-US&page=1"
        return topRatedMoviesStringURL
    }
    
    static func getDetialsURL(movieID: Int) -> String {
        let detialsURL =
            "https://api.themoviedb.org/3/movie/\(movieID)?api_key=\(URLUtils.API_KEY)&language=en-US"
        return detialsURL
    }
    
    static func getReleaseDateURL(movieID: String) {
        
    }
    
    static func getTrailers(MovieID: String) {
        
    }
    
    static func getReviewsURL(movieID: String) -> String {
        let detialsURL =
        "https://api.themoviedb.org/3/movie/\(movieID)?api_key=\(URLUtils.API_KEY)&language=en-US&page=1"
        return detialsURL
    }
}
    
