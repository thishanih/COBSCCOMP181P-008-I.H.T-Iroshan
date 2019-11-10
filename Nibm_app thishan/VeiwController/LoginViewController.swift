//
//  LoginViewController.swift
//  Nibm_app thishan
//
//  Created by Thushal Madhushankha on 10/26/19.
//  Copyright © 2019 Thushal Madhushankha. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         setUpElements ()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements()
        
    {
        // Hide the error label
        errorLabel.alpha = 0
        
        Utilities.styleTextField(emailTextField);
        Utilities.styleTextField(passwordTextField);
        Utilities.styleFilledButton(loginButton);
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loginTapped(_ sender: Any) {
        
        // TODO: Validate Text Fields
        
        // Create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
                
               
            }
            else {
                
               // let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
                
             //   self.view.window?.rootViewController = homeViewController
              //  self.view.window?.makeKeyAndVisible()
                
                
                
                let tabBarViewController = UIStoryboard(name: Constants.Storyboard.mainStoryBoard, bundle: nil).instantiateViewController(withIdentifier: Constants.Storyboard.tabBarController) as! UITabBarController
                
                self.view.window?.rootViewController = tabBarViewController
                self.view.window?.makeKeyAndVisible()
                
                
                
                
                
            }
        }
    }
    
}
