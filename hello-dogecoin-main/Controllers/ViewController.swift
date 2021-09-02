//
//  ViewController.swift
//  hello-dogecoin-main
//
//  Created by Sophia Abino on 8/25/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var dogecoinPrice: UILabel!
    @IBOutlet weak var aboutDogeCoinLabel: UILabel!
    
    @IBOutlet weak var refreshButton: UIButton!
    
    let apiURL = "https://sochain.com//api/v2/get_price/DOGE/USD"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        refreshButton.layer.cornerRadius = 12
        
        getDogecoinData(url: apiURL)
    }

    @IBAction func refreshButton(_ sender: Any) {
        getDogecoinData(url: apiURL)
    }
    
    func getDogecoinData(url: String) {
        
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    
                    print("Sucess! Got the Dogecoin data")
                    
                    let dogecoinJSON : JSON = JSON(response.result.value!)
                    print(dogecoinJSON)
                    
                    self.updateDogecoinData(json: dogecoinJSON)
                    
                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.dogecoinPrice.text = "Connection Issues"
                }
            }
        
        
    }
    
    func updateDogecoinData(json : JSON) {
        
        
        let jsonData = json["data"]["prices"]
        print(jsonData)
        
        
        // Start recognizing this block of code
        DispatchQueue.main.async {
            if let currencyResult = jsonData[0]["price"].string {
                self.dogecoinPrice.text = "$\(String(currencyResult))"
                
            } else {
                self.dogecoinPrice.text = "Data unavailable"
            }
            
            
        }
        
        
    }


}

