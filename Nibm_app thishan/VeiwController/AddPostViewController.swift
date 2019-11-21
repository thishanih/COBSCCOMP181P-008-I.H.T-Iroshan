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
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        self.ref = Database.database().reference()
        
        postIMAGE.isUserInteractionEnabled = true
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
    @IBAction func clickPick(_ sender: Any) {
        self.present(imagePicker, animated: true, completion: nil)
        
    }
  
     @IBAction func savePost(_ sender: Any) {
        
        if (postTitle.text == "") {
            alert(message: "title is required")
            return
        }
        
        if (postDesc.text == ""){
            alert(message: "Description Is Required")
            return
        }
        if (postIMAGE.image == nil){
            alert(message: "Image Is Required")
            return
        }
        self.saveFIRData()
        navigationController?.popViewController(animated: true)
        
    }
    func saveFIRData(){
        self.uploadMedia(image: postIMAGE.image!){ url in
            self.saveImage(profileImageURL: url!){ success in
                if (success != nil){
                    self.dismiss(animated: true, completion: nil)
                }
                
            }
        }
    }
    
    
    func uploadMedia(image :UIImage, completion: @escaping ((_ url: URL?) -> ())) {
        let imageName = UUID().uuidString
        let storageRef = Storage.storage().reference().child("posts").child(imageName)
        let imgData = self.postIMAGE.image?.pngData()
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        storageRef.putData(imgData!, metadata: metaData) { (metadata, error) in
            if error == nil{
                storageRef.downloadURL(completion: { (url, error) in
                    completion(url)
                })
            }else{
                print("error in save image")
                completion(nil)
            }
        }
    }
    
    func saveImage(profileImageURL: URL , completion: @escaping ((_ url: URL?) -> ())){
        let dict = ["desc": postDesc.text!, "imageUrl": profileImageURL.absoluteString,"title": postTitle.text!,"user": user.text!] as [String : Any]
        self.ref.child("posts").childByAutoId().setValue(dict)
    }
    
}



extension AddPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.postIMAGE.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
