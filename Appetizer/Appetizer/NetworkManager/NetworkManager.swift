//
//  NetworkManager.swift
//  Appetizer
//
//  Created by 61066832 on 25/11/24.
//

import UIKit

final class NetworkManager {
    
    public static let shared = NetworkManager()
    private var cache = NSCache<NSString, UIImage>()
    private init () {}
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizers = baseURL + "appetizers"
    
    
//    func getAppetizer(completed : @escaping(Result<[Appetizer], APError>) -> Void) {
//        
//        guard let url = URL(string: appetizers) else {
//            completed(.failure(.invalidURLError))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//      
//            if let _ = error {
//                completed(.failure(.unableToComplete))
//                return
//            }
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//            guard let data = data else {
//                completed(.failure(.invalidData))
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                completed(.success(decodedResponse.request))
//            } catch {
//                
//                print("\(error.localizedDescription)")
//                completed(.failure(.invalidData))
//            }
//        }
//        task.resume()
//    }
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizers) else {
            throw APError.invalidURLError
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
            return decodedResponse.request
        }catch{
            throw APError.invalidData
        }
    }
    
    func downloadImage(fromURLString urlString : String, completed : @escaping(UIImage?) -> Void){
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
