//
//  AddProductViewController.swift
//  AlamoFireExample
//
//  Created by Yogesh Rathore on 06/03/19.
//  Copyright © 2019 Yogesh Rathore. All rights reserved.
//

import UIKit

class AddProductViewController: UIViewController, ImageCallBackDelegate {
    
    

    @IBOutlet weak var Image_View: ImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       

       Image_View.imagedelegate = self
    }
    
    func getImageData(image: NSData) {
        print("Get My Image \(image)")
        // Mark: Here image is NSData
        let base64String = image.base64EncodedString(options: [])
        print("base 64 image \(base64String)")
    }
    
    @IBAction func saveBtn(_ sender: Any) {
    }
    
    @IBAction func dismisBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
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
