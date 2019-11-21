//
//  UserProfile.swift
//  Nibm_app thishan
//
//  Created by Thishan Iroshan on 11/20/19.
//  Copyright © 2019 Thushal Madhushankha. All rights reserved.
//

import Foundation

class UserProfile {
    var uid:String
    var username:String
    var photoURL:URL
    
    init(uid:String, username:String,photoURL:URL) {
        self.uid = uid
        self.username = username
        self.photoURL = photoURL
    }
}

