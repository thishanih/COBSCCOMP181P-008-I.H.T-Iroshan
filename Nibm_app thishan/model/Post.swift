//
//  Post.swift
//  Nibm_app thishan
//
//  Created by Thishan Iroshan on 11/20/19.
//  Copyright © 2019 Thushal Madhushankha. All rights reserved.
//

import Foundation

class Post {
    var id:String
    var author:String
    var text:String
    
    init(id:String, author:String,text:String) {
        self.id = id
        self.author = author
        self.text = text
    }
}
