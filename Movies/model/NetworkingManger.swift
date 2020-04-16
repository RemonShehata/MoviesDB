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
    var retTuple = (String, Int, Int)?.self
    
    func getMoviesFromWebService(stringURL : String,
                                 completionHandlerForGetMovies : @escaping(_ movies : [Movie]) -> Void) {
        
        let url = URL(string: stringURL)
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let task = session.dataTask(with: request) { (data, response, error) in
            do{
                let parsedData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
                
                let results = parsedData["results"] as? [[String:Any]]
                for result in results! {
                    //print(result["poster_path"] as? String ?? "no value for key poster path")
                    let jsonMovie = Movie(filePath: result["poster_path"] as! String,
                                          title: result["original_title"] as! String,
                                          id: result["id"] as! Int)
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
    
    
    
    /*
    func getTopRatedMoviesFromWebService(stringURL : String,
                                 completionHandlerForGetMovies : @escaping(_ movies : [Movie]) -> Void) {
        
        let url = URL(string: stringURL)
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let task = session.dataTask(with: request) { (data, response, error) in
            do{
                let parsedData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
                
                let results = parsedData["results"] as? [[String:Any]]
                for result in results! {
                    //print(result["poster_path"] as? String ?? "no value for key poster path")
                    let jsonMovie = Movie(filePath: result["poster_path"] as! String,
                                          title: result["original_title"] as! String)
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
    */
    
    
    
    func getDetialsFromWebService(stringURL : String, completionHandlerForDetails : @escaping(_ retTuple: (String?, Int?, Int?)) -> Void)  {
        
        var releaseDate : String?
        
        let url = URL(string: stringURL)
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let task = session.dataTask(with: request) { (data, response, error) in
            do{
                let parsedData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
                
                releaseDate = parsedData["release_date"] as? String
                
                completionHandlerForDetails((releaseDate!,1,2))
            }catch let error{
                print("Json Error")
                print(error)
                completionHandlerForDetails((nil,nil,nil))
            }
            
        }.resume()
    }
}
