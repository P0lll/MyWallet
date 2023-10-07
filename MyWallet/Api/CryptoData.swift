//
//  CryptoData.swift
//  MyWallet
//
//  Created by Pavel Bukatin on 04.10.2023.
//

import Foundation

// MARK: - CryptoPrice
struct CryptoPrice: Codable {
    let data: [Datum]
    let info: Info
}

// MARK: - Datum
struct Datum: Codable {
    let id, symbol, name, nameid: String
    let rank: Int
    let priceUsd, percentChange24H, percentChange1H, percentChange7D: String
    let priceBtc, marketCapUsd: String
    let volume24, volume24A: Double
    let csupply: String
    let tsupply, msupply: String?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, nameid, rank
        case priceUsd = "price_usd"
        case percentChange24H = "percent_change_24h"
        case percentChange1H = "percent_change_1h"
        case percentChange7D = "percent_change_7d"
        case priceBtc = "price_btc"
        case marketCapUsd = "market_cap_usd"
        case volume24
        case volume24A = "volume24a"
        case csupply, tsupply, msupply
    }
}

// MARK: - Info
struct Info: Codable {
    let coinsNum, time: Int

    enum CodingKeys: String, CodingKey {
        case coinsNum = "coins_num"
        case time
    }
}


