//
//  ViewController.swift
//  Nibm_app thishan
//
//  Created by Thushal Madhushankha on 10/26/19.
//  Copyright © 2019 Thushal Madhushankha. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    

    func setUpElements (){
        
        Utilities.styleFilledButton(signUpButton);
        Utilities.styleHollowButton(loginUpButton);
    }

   
    
    
    
    
}

