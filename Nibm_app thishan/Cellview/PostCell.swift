//
//  PostCell.swift
//  Nibm_app thishan
//
//  Created by Thishan Iroshan on 11/21/19.
//  Copyright © 2019 Thushal Madhushankha. All rights reserved.
//

import UIKit
import Nuke

class PostCell: UITableViewCell {
    @IBOutlet var userName: UILabel!
    @IBOutlet var postTitle: UILabel!
    @IBOutlet var postImage: UIImageView!
    @IBOutlet var postDescription: UILabel!
    
    override func awakeFromNib() {
         super.awakeFromNib()
        

        // Do any additional setup after loading the view.
    }
    
    func populateData(post: AddPostModel)  {
        
        postTitle.text = post.title
        postDescription.text = post.description
        userName.text = post.user
        
        let imgUrl = URL(string: post.image_url)
        
        Nuke.loadImage(with: imgUrl!, into: postImage)
        
    }

}
