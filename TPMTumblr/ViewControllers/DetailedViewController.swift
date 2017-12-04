//
//  DetailedViewController.swift
//  TPMTumblr
//
//  Created by Samman Thapa on 12/4/17.
//  Copyright © 2017 Samman Thapa. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    
    @IBOutlet weak var posterImageView: UIImageView!
    
    var post: NSDictionary!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let photos = post.value(forKeyPath: "photos") as? [NSDictionary] {
            print ("check")
            print (photos[0].value(forKeyPath: "original_size.url") as? String)
            let imageUrlString = photos[0].value(forKeyPath: "original_size.url") as? String
            
            if let imageUrl = URL(string: imageUrlString!) {
                self.posterImageView.af_setImage(withURL: imageUrl)
            } else {
                print("imageUrlString is nil")
            }
        } else {
            print("photos is nil")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
