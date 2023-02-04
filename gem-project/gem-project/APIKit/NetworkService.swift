//
//  NetworkService.swift
//  FunRecipe
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    func cookingRecord(_ offset: Int, _ limit: Int, completion: @escaping(CookingRecords?, Error?) -> Void) {
        let queryItem: [QueryItem] = [
            QueryItem(name: ParameterName.OFFSET.rawValue, value: "\(offset)"),
            QueryItem(name: ParameterName.LIMIT.rawValue, value: "\(limit)")
        ]
        APIKit.shared.fetch(url: Constants.COOKING_RECORDS_API, method: .GET, queryItems: queryItem) { (data, response, error) in
            if response != 200, let e = error {
                // network error.
                completion(nil, NSError(domain: e.localizedDescription, code: response, userInfo: nil))
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "DATA_ERROR".localized(), code: Constants.DATA_ERROR_CODE, userInfo: nil))
                return
            }
            
            do {
                let data = try JSONDecoder().decode(CookingRecords.self, from: data)
                completion(data, nil)
            } catch let error {
                completion(nil, NSError(domain: error.localizedDescription, code: Constants.JSON_PARSE_ERROR_CODE, userInfo: nil))
            }
        }
    }
    
    func getImageData(url: String, completion: @escaping(Data?, Error?) -> Void) {
        APIKit.shared.fetch(url: url) { (data, response, error) in
            if response != 200, let e = error {
                // network error.
                completion(nil, NSError(domain: e.localizedDescription, code: response, userInfo: nil))
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "DATA_ERROR".localized(), code: Constants.DATA_ERROR_CODE, userInfo: nil))
                return
            }
            
            completion(data, nil)
        }
    }
}
