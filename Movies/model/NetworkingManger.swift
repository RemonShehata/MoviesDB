//
//  NetworkingUtils.swift
//  Movies
//
//  Created by Remon Gerges Shehata on 1/3/20.
//  Copyright © 2020 Remon Gerges Shehata. All rights reserved.
//

import Foundation
import UIKit

class NetworkingManger {
    
    func getMoviesFromWebService(requestURL : URL,
                                 completionHandlerForGetMovies : @escaping(_ movies : [Movie]) -> Void) {
        
        //let url = URL(string: "https://api.androidhive.info/json/movies.json")
        let request = URLRequest(url: requestURL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let task = session.dataTask(with: request) { (data, response, error) in
            do{
                let parsedData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
                
//                for jsonDict in jsonArray {
//                                    let jsonMovie : Movie = Movie(title: jsonDict["title"] as! String,
//                                                                  image: jsonDict["image"] as! String,
//                                                                  rating: jsonDict["rating"] as! Double,
//                                                                  releaseYear: jsonDict["releaseYear"] as! Int,
//                                                                  genre: jsonDict["genre"] as! Array<String>)
//
//                    let jsonMovie = Movie(filePath: jsonDict["poster_path"] as! String)
//                    print(jsonDict["poster_path"] as! String)
//                    moviesArr.append(jsonMovie)
//                }
                let results = parsedData["results"] as? [[String:Any]]
                for result in results! {
                    print(result["poster_path"] as? String ?? "no value for key poster path")
                    let jsonMovie = Movie(filePath: result["poster_path"] as! String)
                    Movie.moviesArr.append(jsonMovie)
                }
                completionHandlerForGetMovies(Movie.moviesArr)
            }catch let error{
                print("Json Error")
                print(error)
                completionHandlerForGetMovies(Movie.moviesArr)
            }
            
        }.resume()
    }
}
