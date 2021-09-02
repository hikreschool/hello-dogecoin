//
//  coins.swift
//  pmsarmiento_coin_price
//
//  Created by admin on 2021-08-26.
//

import Foundation

struct CoinPrice: Decodable {
    let price: String
    let priceBase: String
    let exchange: String
    let time: Double
    
    enum CodingKeys: String, CodingKey {
        case price
        case priceBase = "price_base"
        case exchange
        case time
    }
}


struct CoinData: Decodable {
    let network: String
    let prices: [CoinPrice]
}

struct ChainResult: Decodable {
    let status: String
    let data: CoinData
}
