//
//  ViewController.swift
//  accessToImageTest
//
//  Created by Taniguchi Keisuke on 2016/05/20.
//  Copyright © 2016年 Taniguchi Keisuke. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var cameraView: UIImageView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var albumBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Mark Action
    
    
    @IBAction func tapStartBtn(sender: AnyObject) {
        //dataを撮ってくる元
        let sourceType: UIImagePickerControllerSourceType = .Camera
        //UIImagePickerController
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            presentViewController(cameraPicker, animated: true, completion: nil)
        }else{
            print("error")
        }
    }
    @IBAction func tapSaveBtn(sender: AnyObject) {
        let image: UIImage? = cameraView.image
        if let image = image{
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(MainViewController.image(_:didFinishSavingWithError:contextInfo:)), nil)
        }
    }
    @IBAction func tapAlbumBtn(sender: AnyObject) {
        let sourceType: UIImagePickerControllerSourceType = .PhotoLibrary
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.presentViewController(cameraPicker, animated: true, completion: nil)
        }else{
            print("error")
        }
    }
    
    //Mark Delegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            cameraView.contentMode = .ScaleAspectFit
            cameraView.image = pickedImage
            
            picker.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //Mark Method
    
    func image(image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutablePointer<Void>) {
        
        if error != nil {
            print(error.code)
        }
        else{
            print("ok")
        }
    }
}

