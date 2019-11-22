//
//  RestPasswordViewController.swift
//  Nibm_app thishan
//
//  Created by Thishan Iroshan on 11/9/19.
//  Copyright © 2019 Thushal Madhushankha. All rights reserved.
//

import UIKit
import Firebase

class RestPasswordViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var RestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
setUpElements ()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        
        Utilities.styleTextField(emailTextField);
        Utilities.styleFilledButton(RestButton);
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func RestTapped(_ sender: Any) {
        
        Auth.auth().sendPasswordReset(withEmail: emailTextField.text!) { error in
            if self.emailTextField.text?.isEmpty==true{
                let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(resetFailedAlert, animated: true, completion: nil)
            }
            if error != nil && self.emailTextField.text?.isEmpty==false{
                let resetEmailAlertSent = UIAlertController(title: "Reset Email Sent", message: "Reset email has been sent to your login email, please follow the instructions in the mail to reset your password", preferredStyle: .alert)
                resetEmailAlertSent.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(resetEmailAlertSent, animated: true, completion: nil)
                
                 self.transitionToLogin()
            }
        }
    }
    
        
    
    
    func transitionToLogin() {
        
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.loginViewController) as? LoginViewController
        
        view.window?.rootViewController = loginViewController
        view.window?.makeKeyAndVisible()
        
    }
}

//sss
