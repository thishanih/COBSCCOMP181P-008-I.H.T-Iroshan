//
//  SignUpViewController.swift
//  Nibm_app thishan
//
//  Created by Thushal Madhushankha on 10/26/19.
//  Copyright © 2019 Thushal Madhushankha. All rights reserved.
//


import Foundation

struct AddPostModel: Codable {
    
    var title : String!
    var description : String!
    var user: String!
    var image_url: String!
    
    init(title: String, description: String,user: String,image_url:String) {
        self.title = title
        self.description = description
        self.user=user
        self.image_url=image_url
    }
    
    
    
    
}
