//
//  HomeViewController.swift
//  Nibm_app thishan
//
//  Created by Thushal Madhushankha on 10/26/19.
//  Copyright © 2019 Thushal Madhushankha. All rights reserved.
//

import UIKit
import Firebase
import LocalAuthentication

class HomeViewController: UIViewController {var postsList : [AddPostModel] = []
    var ref: DatabaseReference!
    var window: UIWindow?
    
    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
   //     tableview.dataSource = self
 //       tableview.delegate = self
        
        getStudentData()
       

        // Do any additional setup after loading the view.
    }
    
    func getStudentData(){
        
        let friendsRef = ref.child("posts")
        
        
        friendsRef.observe(.value){ snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                
                let studentDic = child.value as! NSDictionary
                
                let title = studentDic["title"] as! String
                let description = studentDic["desc"] as! String
                let user = studentDic["user"] as! String
                let image_url = studentDic["imageUrl"] as! String
                
                let post = AddPostModel(
                    title: title,
                    description: description,
                    user: user ,
                    image_url: image_url
                )
                
                self.postsList.append(post)
                
                print(child)
            }
            
            self.tableview.reloadData()
            
            
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

}

