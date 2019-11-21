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
        
       tableview.dataSource = self
        tableview.delegate = self
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
    
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return postsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! PostCell
        
        
        cell.populateData(post: postsList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "friendDetail", sender: postsList[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "friendDetail" {
            if let viewController = segue.destination as? postsViewController{
                
                viewController.posts = sender as? AddPostModel
            }
        }
    }
}



