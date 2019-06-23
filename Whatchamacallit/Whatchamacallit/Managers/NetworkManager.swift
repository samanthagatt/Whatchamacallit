//
//  NetworkManager.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/20/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

extension NSError {
    convenience init(code: Int) {
        self.init(domain: Bundle.main.bundleIdentifier ?? "", code: code, userInfo: nil)
    }
}

enum NetworkManager {
    
    enum Method: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    enum NetworkError: Error {
        case constructingURLFailed
        case noDataReturned
        case decodingDataFailed
        case badURL
        case noNetworkResponse
        case dataTaskError(nsError: NSError)
        case apiError(error: Error)
    }
    
    static func constructURL(baseURLString: String, appendingPaths: [String] = [], queries: [String: String] = [:]) -> URL? {
        guard var url = URL(string: baseURLString) else { return nil }
        for path in appendingPaths {
            url.appendPathComponent(path)
        }
        var queryArray: [URLQueryItem] = []
        for query in queries {
            queryArray.append(URLQueryItem(name: query.key, value: query.value))
        }
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = queryArray.isEmpty ? nil : queryArray
        return urlComponents?.url
    }
    
    private static func dataTask<T: Decodable>(request: URLRequest, completion: @escaping (T?, NetworkError?) -> Void) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, .dataTaskError(nsError: error as NSError))
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(nil, .noNetworkResponse)
                    return
                }
                if 200..<300 ~= httpResponse.statusCode {
                    guard let data = data else {
                        completion(nil, .noDataReturned)
                        return
                    }
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completion(decodedData, nil)
                        return
                    } catch {
                        completion(nil, .decodingDataFailed)
                        return
                    }
                } else {
                    completion(nil, .dataTaskError(nsError: NSError(code: httpResponse.statusCode)))
                    return
                }
            }
        }.resume()
    }
    
    static func makeRequest<T: Decodable>(method: Method = .get, baseURLString: String, appendingPaths: [String] = [], queries: [String: String] = [:], headers: [String: String] = [:], encodedData: Data? = nil, shouldReturnData: Bool = true, completion: @escaping (T?, NetworkError?) -> Void) {
        guard let url = constructURL(baseURLString: baseURLString, appendingPaths: appendingPaths, queries: queries) else {
            completion(nil, .constructingURLFailed)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        request.httpBody = encodedData
        dataTask(request: request, completion: completion)
    }
    
    static func getImage(url: URL, completion: @escaping (UIImage?, NetworkError?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, .dataTaskError(nsError: error as NSError))
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(nil, .noNetworkResponse)
                    return
                }
                if 200..<300 ~= httpResponse.statusCode {
                    guard let data = data else {
                        completion(nil, .noDataReturned)
                        return
                    }
                    let image = UIImage(data: data)
                    completion(image, nil)
                    return
                } else {
                    completion(nil, .dataTaskError(nsError: NSError(code: httpResponse.statusCode)))
                }
            }
        }.resume()
    }
    
    static func getImage(urlString: String, completion: @escaping (UIImage?, NetworkError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, .badURL)
            return
        }
        getImage(url: url, completion: completion)
    }
}
