# AlamoFireExample
Alamofire is used for networking. here I am using GET and POST method of alamofire


# Uses
AlamoFire Get Method 

var dataObject = [ProductList]()

      let urlStr = "https://awesome-store-server.herokuapp.com/products"
        ServiceWrapper.requestGETURL(urlStr, success: { (responseData) in
            print("Get Response::- \(responseData)")
            do {
                //here dataResponse received from a network request
                let decoder = JSONDecoder()
                let model = try decoder.decode([ProductList].self, from: responseData) //Decode JSON Response Data
                self.dataObject = model
                self.productTable.reloadData()
            } catch let parsingError {
                print("Error", parsingError)
            }
            
            
        }) { (error) in
            print("Get Error::- \(error)")
        }
        
 Alamofire Post Method
 
         let urlStr = "https://awesome-store-server.herokuapp.com/products"
        let parameter = ["name": "One Plus 6T",
                          "code": "OPS-1100",
                          "releaseDate": "May 19, 2018",
                          "description": "One Plus 6T mobile phone",
                          "price": 700,
                          "starRating": 4.2,
                          "imageUrl": "https://i.gadgets360cdn.com/products/large/1540904856_635_oneplus_6t.jpg?downsize=770:*&output-quality=70&output-format=webp"] as [String : Any]

        ServiceWrapper.requestPOSTURL(urlStr, params: parameter, headers: nil, success: { (responseData) in
            print("Post Response : \(responseData)")
            let alertController = UIAlertController(title: "Success", message: "Product Added Successfully", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                self.GetProducts()
            }))
            self.present(alertController, animated: true, completion: nil)


        }) { (error) in
             print("Post Error::- \(error)")
        }
        
        
# Image Picker

     Call ImageCallBackDelegate 
    
Take UIView and give class ImagePickerController in storyboard and delegate it inside viewdidload

    @IBOutlet weak var Image_View: ImagePickerController!
    Image_View.imagedelegate = self
    
Call callback method here you will get image in NSData format you can convert it in base64 format and upload in sever

      func getImageData(image: NSData) {
        print("Get My Image \(image)")
        // Mark: Here image is NSData
        let base64String = image.base64EncodedString(options: [])
        print("base 64 image \(base64String)")
    }
