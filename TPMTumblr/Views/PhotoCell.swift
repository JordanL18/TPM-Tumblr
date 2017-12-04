//
//  PhotoCell.swift
//  TPMTumblr
//
//  Created by Samman Thapa on 12/4/17.
//  Copyright © 2017 Samman Thapa. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
    
    
    @IBOutlet weak var tumblrPostImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
