//
//  SettingsViewController.swift
//  App
//
//  Created by Agnesa  on 5.4.23.
//

import UIKit
import Photos
import SafariServices

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    
    var imagePicker: UIImagePickerController?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImagePicker()

        // Do any additional setup after loading the view.
    }
    func setupImagePicker(){
        imagePicker = UIImagePickerController()
        imagePicker?.sourceType = .photoLibrary
        imagePicker?.delegate = self
        
        PHPhotoLibrary.requestAuthorization{
            status in
                print("request authorization status = \(status)")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        profileImage.image = selectedImage
        imagePicker?.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker?.dismiss(animated: true)
    }
    @IBAction func pickerButton(_ sender: Any) {
        if PHPhotoLibrary.authorizationStatus() == .authorized{
            if let imagePic = imagePicker{
                present(imagePic, animated: true)
            }
        }
    }
    @IBAction func goToPrivacyPolicyLink(_ sender: Any) {
        let svc = SFSafariViewController(url: URL(string:"https://www.smooth-on.com/page/privacy-policy/?pk_campaign=dynamicsearch&pk_kwd=&gclid=CjwKCAjwjMiiBhA4EiwAZe6jQzxXzebtYuU3Fys66YEXyJo6mUhYZPDLn7UI9iPTxAfNxp0nn-bRZRoCtgYQAvD_BwE")!)
        self.present(svc, animated: true, completion: nil)
    }
    
    @IBAction func aboutUsButtonTapped(_ sender: Any) {
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController

        self.navigationController?.pushViewController(storyboard, animated: true)
    }
  
    @IBAction func signOutTapped(_ sender: UITapGestureRecognizer) {
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController

        self.navigationController?.pushViewController(storyboard, animated: true)
    }
    
}
