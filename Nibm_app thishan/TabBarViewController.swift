//
//  TabBarViewController.swift
//  Nibm_app thishan
//
//  Created by Thishan Iroshan on 11/11/19.
//  Copyright © 2019 Thushal Madhushankha. All rights reserved.
//



    import UIKit
    import BiometricAuthentication
    
    class TabViewController: UITabBarController,UITabBarControllerDelegate {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
            self.delegate = self
        }
        
        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            if viewController.isKind(of: MyProfileViewController.self) {
                
                //call biometric authentcation library
                BioMetricAuthenticator.authenticateWithBioMetrics(reason: "Identify yourself") { (result) in
                    
                    switch result {
                    case .success( _):
                        print("Access Granted!")
                        self.selectedIndex = 2
                    case .failure(let error):
                        print("Access Denied!")
                        
                    }
                }
                return false
            }
            return true
            
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
