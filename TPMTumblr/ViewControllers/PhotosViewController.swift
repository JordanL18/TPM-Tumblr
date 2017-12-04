//
//  PhotosViewController.swift
//  TPMTumblr
//
//  Created by Samman Thapa on 12/4/17.
//  Copyright © 2017 Samman Thapa. All rights reserved.
//

import UIKit

import AlamofireImage

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tumblrPhotosTableView: UITableView!
    
    var posts: [NSDictionary]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tumblrPhotosTableView.delegate = self
        self.tumblrPhotosTableView.dataSource = self
        
        // Network request snippet
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                // TODO: Get the posts and store in posts property
                
                // Get the dictionary from the response key
                let responseDictionary = dataDictionary["response"] as! [String: Any]
//                // Store the returned array of dictionaries in our posts property
                self.posts = responseDictionary["posts"] as? [NSDictionary]
                
                print (self.posts)
                
                // TODO: Reload the table view
                self.tumblrPhotosTableView.reloadData()

            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let posts = self.posts {
            return posts.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photoCell = self.tumblrPhotosTableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! PhotoCell
        
        let currPost = self.posts![indexPath.row]
        
        if let photos = currPost.value(forKeyPath: "photos") as? [NSDictionary] {
            let imageUrlString = photos[0].value(forKeyPath: "original_size.url") as? String
            
            if let imageUrl = URL(string: imageUrlString!) {
                photoCell.tumblrPostImageView.af_setImage(withURL: imageUrl)
            } else {
                print("imageUrlString is nil")
            }
            
            
        } else {
            print("photos is nil")
        }

        return photoCell
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
