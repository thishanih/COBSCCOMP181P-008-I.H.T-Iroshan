//
//  postsViewController.swift
//  Nibm_app thishan
//
//  Created by Thishan Iroshan on 11/21/19.
//  Copyright © 2019 Thushal Madhushankha. All rights reserved.
//

import UIKit
import Nuke
class postsViewController: UIViewController {
    var posts: AddPostModel? = nil
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var studentImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postDescription: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentImage.layer.cornerRadius = studentImage.frame.width / 2
        
        // Do any additional setup after loading the view.
        
        if posts != nil{
            
            let url = URL(string: ((posts?.image_url)!))
            
            Nuke.loadImage(with: url!, into: studentImage)
            
            postTitle.text = posts?.title
            postDescription.text = posts?.description
            
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


