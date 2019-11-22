//
//  MyProfileViewController.swift
//  Nibm_app thishan
//
//  Created by Thishan Iroshan on 11/22/19.
//  Copyright © 2019 Thushal Madhushankha. All rights reserved.
//

import UIKit
import Firebase


class MyProfileViewController: UIViewController {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var mobileNumberLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var fetchButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var signButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupElement()
        // Do any additional setup after loading the view.
       
    }
    
    func setupElement(){
        errorLabel.alpha=0
        
        Utilities.styleHollowButton(fetchButton);
        Utilities.styleFilledButton(signButton);
    }
    
    @IBAction func tappedview(_ sender: Any) {
        
        let db = Firestore.firestore()
        
        let user = Auth.auth().currentUser
        if let user = user {
            let uid = user.uid
            db.collection("users").whereField("uid", isEqualTo: uid)
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            
                            //print("\(document.documentID) => \(document.data())")
                            let firstName = document.get("firstname")
                            let lastName = document.get("lastname")
                            let mobileNumber = document.get("phone")
                            let profilePhoto = document.get("profile_photo")
                            let birthday = document.get("birthdate")
                            let email = document.get("email")
                            
                            
    
                            self.firstNameLabel.text = firstName as? String
                            self.lastNameLabel.text = lastName as? String
                            self.birthdayLabel.text = birthday as? String
                            self.emailLabel.text = email as? String
                            self.mobileNumberLabel.text = mobileNumber as? String
                            
                            if let url = NSURL (string: profilePhoto as! String) {
                                if let data = NSData(contentsOf: url as URL) {
                                    self.profileImageView.contentMode = UIView.ContentMode.scaleAspectFit
                                    self.profileImageView.image = UIImage (data: data as Data)
                                    
                                }
                            }
                        }
                        
                    }
            }
        }
       
        
        
    }
    
    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    
    
    @IBAction func handlesignOut(_ sender: Any) {
        
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        UserDefaults.standard.removeObject(forKey: "LoggedUser")
        UserDefaults.standard.removeObject(forKey: "LoggedIn")
        UserDefaults.standard.removeObject(forKey: "UserUID")
        UserDefaults.standard.synchronize()
    }
    
}

        

