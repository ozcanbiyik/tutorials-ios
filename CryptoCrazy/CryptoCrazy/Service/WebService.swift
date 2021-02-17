//
//  WebService.swift
//  CryptoCrazy
//
//  Created by Özcan BIYIK on 31.01.2021.
//

import Foundation

class WebService {
    
    func downloadCurrenices(url : URL, completion : @escaping([CryptoCurrency]?) -> ()){
        
        // Eğer ki internetten bir veri ile çalışıyorsanız ve onunla ilgili bir döndürme işlemi yapıcaksanız, escaping kullanabilirsiniz.
        
        // ? (Optional) yapmamız mantıklı, internet kesilebilir vb.
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from : data)
                print(cryptoList)
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
        }.resume()
        
    }
    
}
