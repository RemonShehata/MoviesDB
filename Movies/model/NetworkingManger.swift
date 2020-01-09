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
    
    var moviesRet = [Movie]()
    
    
    func getMoviesFromWebService(stringURL : String,
                                 completionHandlerForGetMovies : @escaping(_ movies : [Movie]) -> Void) {
        
        let requestURL = URL(string: stringURL)
        let request = URLRequest(url: requestURL!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let task = session.dataTask(with: request) { (data, response, error) in
            do{
                let parsedData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
                
                let results = parsedData["results"] as? [[String:Any]]
                for result in results! {
                    //print(result["poster_path"] as? String ?? "no value for key poster path")
                    let jsonMovie = Movie(filePath: result["poster_path"] as! String)
                    self.moviesRet.append(jsonMovie)
                }
                completionHandlerForGetMovies(self.moviesRet)
            }catch let error{
                print("Json Error")
                print(error)
                completionHandlerForGetMovies(self.moviesRet)
            }
            
        }.resume()
    }
}
