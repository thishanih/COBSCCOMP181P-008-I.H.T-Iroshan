//
//  AddPostViewController.swift
//  Nibm_app thishan
//
//  Created by Thishan Iroshan on 11/21/19.
//  Copyright © 2019 Thushal Madhushankha. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController {
    @IBOutlet var postTitle: UITextField!
    @IBOutlet var user: UITextField!
    @IBOutlet var postIMAGE: UIImageView!
    @IBOutlet var postDesc: UITextField!
    
    @IBOutlet var Uploadimage: UIButton!
    @IBOutlet var savebu: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  setUpElements ()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
       
        
        Utilities.styleTextField(postTitle);
        Utilities.styleTextField(user);
        Utilities.styleTextField(postDesc);
        Utilities.styleFilledButton(Uploadimage);
        Utilities.styleFilledButton(savebu);
        
        
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
