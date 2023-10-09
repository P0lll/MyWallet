//
//  ApiManager.swift
//  MyWallet
//
//  Created by Pavel Bukatin on 04.10.2023.
//

import Foundation


final class ApiManager {
    static let shared = ApiManager() 
    
    let urlName = "https://api.coinlore.net/api/tickers/"
    
    func getCoinPrice(completion: @escaping ([Datum]) -> Void) {
        let url = URL(string: urlName)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let cryptoData = try? JSONDecoder().decode(CryptoPrice.self, from: data) {
                completion(cryptoData.data)
            } else {
                print("Fail")
            }
        }
        task.resume()
    }
}

    
