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

class MoviesCollectionViewController: UICollectionViewController,
                            UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var CollectionViewMovie: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let width = view.frame.size.width/2
//        let layout = CollectionViewMovie.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: width, height: 2*width)
        
        registerCellOfCollectionView()
        
        let n = NetworkingManger()
        n.getMoviesFromWebService(stringURL: URLUtils.getPopularMoviesURL(), completionHandlerForGetMovies: {(retMovies) in
            Movie.moviesArr = retMovies
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
        
    }
    
    var collectionViewFlowLayout:UICollectionViewFlowLayout!
    
    func registerCellOfCollectionView()
    {
        if collectionViewFlowLayout == nil
        {
            let numberOfItemPerRow :CGFloat = 2
            let minimunLineSpacing :CGFloat = 0
            let minimunInteritemSpacing :CGFloat = 0
            
            let width = (CollectionViewMovie.frame.width / numberOfItemPerRow)
            let height = (CollectionViewMovie.frame.height / numberOfItemPerRow)
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.minimumLineSpacing = minimunLineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = minimunInteritemSpacing
            CollectionViewMovie.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return Movie.moviesArr.count > 0 ? Movie.moviesArr.count : 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
        
        // Configure the cell
        

        var currentMovie = Movie.moviesArr[indexPath.row].filePath
//        print(currentMovie)
//        print(Movie.moviesArr[indexPath.row].movieTitle)
        var currentImageURL = URLUtils.getImageFullURL(posterPath: currentMovie)
        
        cell.imageView.sd_setImage(with: currentImageURL, placeholderImage:UIImage(named: "placeholder.jpg"))
        //cell.imageView.image = UIImage(named: "placeholder.jpg")
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailsVC : DetialsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "details") as! DetialsViewController
        
        detailsVC.recievedMovie = Movie.moviesArr[indexPath.row]
        
        self.navigationController?.pushViewController(detailsVC, animated: true)
        
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let imgWidth = collectionView.frame.width/2.0
//        let imgHeight = collectionView.frame.height / 2.0
//        return CGSize(width: imgWidth, height: imgHeight)
//    }
    
}
