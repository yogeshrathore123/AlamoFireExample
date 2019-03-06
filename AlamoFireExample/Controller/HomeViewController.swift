//
//  HomeViewController.swift
//  AlamoFireExample
//
//  Created by Yogesh Rathore on 01/03/19.
//  Copyright © 2019 Yogesh Rathore. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var productTable: UITableView!
    var dataObject = [ProductList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       GetProducts()
        
    }
    
    func GetProducts() {
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataObject.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell", for: indexPath) as! ProductListTableViewCell
        cell.productImageView.layer.borderColor = UIColor.blue.cgColor
        cell.productImageView.layer.borderWidth = 1
        cell.productImageView.layer.cornerRadius = cell.productImageView.frame.height/2
        
        cell.nameLbl.text = self.dataObject[indexPath.row].name
        cell.codeLbl.text = self.dataObject[indexPath.row].code
        cell.productId.text = "Product ID : \(self.dataObject[indexPath.row].id!)"
        cell.releaseDateUrl.text = self.dataObject[indexPath.row].releaseDate
        cell.starRatinglbl.text = "\(self.dataObject[indexPath.row].starRating!)"
        cell.descriptionLbl.text = self.dataObject[indexPath.row].description
        let imageUrl = self.dataObject[indexPath.row].imageUrl
       
        let url = URL(string: imageUrl ?? "nooo")
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        cell.productImageView.image = UIImage(data: data!)

        
        return cell
    }

    @IBAction func addProduct(_ sender: UIBarButtonItem) {
//        let urlStr = "https://awesome-store-server.herokuapp.com/products"
//        let parameter = ["name": "One Plus 6T",
//                          "code": "OPS-1100",
//                          "releaseDate": "May 19, 2018",
//                          "description": "One Plus 6T mobile phone",
//                          "price": 700,
//                          "starRating": 4.2,
//                          "imageUrl": "https://i.gadgets360cdn.com/products/large/1540904856_635_oneplus_6t.jpg?downsize=770:*&output-quality=70&output-format=webp"] as [String : Any]
//
//        ServiceWrapper.requestPOSTURL(urlStr, params: parameter, headers: nil, success: { (responseData) in
//            print("Post Response : \(responseData)")
//            let alertController = UIAlertController(title: "Success", message: "Product Added Successfully", preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) in
//                self.GetProducts()
//            }))
//            self.present(alertController, animated: true, completion: nil)
//
//
//        }) { (error) in
//             print("Post Error::- \(error)")
//        }
        
        if let nextController = storyboard?.instantiateViewController(withIdentifier: "AddProductViewController") as? AddProductViewController {
            self.present(nextController, animated: true, completion: nil)
        }
    }
    
}

