//
//  APIKit.swift
//  FunRecipe
//
//  Created by 中江洋史 on 2022/10/29.
//

import Foundation

final class APIKit {
    static let shared = APIKit()
    
    private init() {}
    
    private func urlQueryBuilder(items: [QueryItem]) -> String {
        if items.count == 0 {
            return ""
        }
        
        var query = "?"
        for item in items {
            query += "\(item.name)=\(item.value)&"
        }
        return String(query.dropLast())
    }
    
    func fetch(url: String, method: HttpMethod = .GET, queryItems: [QueryItem] = [], completion: @escaping (_ data: Data?, _ HTTPStatusCode: Int, _ error: Error?) -> Void) {
        guard var urlComponents = URLComponents(string: url) else {
            return
        }
        
        if method == .GET {
            let queryString = urlQueryBuilder(items: queryItems)
            urlComponents = URLComponents(string: url + queryString) ?? urlComponents
        } else {
            for item in queryItems {
                urlComponents.queryItems?.append(URLQueryItem(name: item.name, value: item.value))
            }
        }
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async(execute: {
                completion(data, (response as! HTTPURLResponse).statusCode,error)
            })
        }
        
        task.resume()
    }
}
