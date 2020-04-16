//
//  DetialsViewController.swift
//  Movies
//
//  Created by Remon Gerges Shehata on 1/10/20.
//  Copyright © 2020 Remon Gerges Shehata. All rights reserved.
//

import UIKit
import SDWebImage

class DetialsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var recievedMovie : Movie?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = recievedMovie?.movieTitle
        imageView.sd_setImage(with: URLUtils.getImageFullURL(posterPath: recievedMovie!.filePath), placeholderImage:UIImage(named: "placeholder.jpg"))
        
        let n = NetworkingManger()
        let url = URLUtils.getDetialsURL(movieID: recievedMovie!.Id)
        var (date, duration, rating) : (String?,Int?,Int?)
         n.getDetialsFromWebService(stringURL: url) { (detailsTuple) in
            date = detailsTuple.0
            duration = detailsTuple.1
            rating = detailsTuple.2
            DispatchQueue.main.async {
                self.dateLabel.text = date 
            }
        }
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
