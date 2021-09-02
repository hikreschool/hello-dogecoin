//
//  ViewController.swift
//  pmsarmiento_coin_price
//
//  Created by admin on 2021-08-25.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var fetchPriceButton: UIButton!
    var urlOfCoin = "https://chain.so/api/v2/get_price/DOGE/USD"
    var chain: ChainResult?
    var coinData: CoinData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.fetchPriceButton.layer.cornerRadius = self.fetchPriceButton.frame.height/2
    }
    
    @IBAction func fetchPriceButton(_ sender: UIButton) {
        getPrice()
    }
    
    func getPrice() {
        AF.request(urlOfCoin)
          .validate()
            .responseDecodable(of: ChainResult.self) { (response) in
                guard let chainData = response.value else { return }
                self.chain = chainData
                self.coinData = self.chain?.data
                print(self.coinData?.prices ?? [])
                
                self.priceLabel.text = self.coinData?.prices[0].price
            }
        }

}

