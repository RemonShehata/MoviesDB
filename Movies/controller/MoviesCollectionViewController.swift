//
//  MoviesCollectionViewController.swift
//  Movies
//
//  Created by Remon Gerges Shehata on 1/3/20.
//  Copyright © 2020 Remon Gerges Shehata. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "Cell"

class MoviesCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let n = NetworkingManger()
        n.getMoviesFromWebService(stringURL: URLUtils.getPopularMoviesURL(), completionHandlerForGetMovies: {(retMovies) in
            Movie.moviesArr = retMovies
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
        
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return Movie.moviesArr.count > 0 ? Movie.moviesArr.count : 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
        
        // Configure the cell
        

        var currentMovie = Movie.moviesArr[indexPath.row].filePath
        print(currentMovie)
        var currentImageURL = URLUtils.getImageFullURL(posterPath: currentMovie)
        
        cell.imageView.sd_setImage(with: currentImageURL, placeholderImage:UIImage(named: "placeholder.jpg"))
        //cell.imageView.image = UIImage(named: "placeholder.jpg")
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let imgWidth = collectionView.frame.width/3.0
        //let imgHeight = collectionView.frame.height / 2.0
        return CGSize(width: imgWidth, height: imgWidth)
    }
    
}
