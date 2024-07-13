//
//  HTTPClientImpl.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 11/07/24.
//

import Foundation
import RxSwift

class HTTPClientImpl: HTTPClient {
    
    private let identifier: HTTPIdentifier
    
    init(identifier: HTTPIdentifier) {
        self.identifier = identifier
    }
    
    func sent<T: Codable>(request apiRequest: any HTTPRequest) -> Single<T> {
        return Single<T>.create { single in
            let request = apiRequest.request(with: self.identifier.baseUrl)
            
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if response != nil {
                    let responseCasting: HTTPURLResponse = response as! HTTPURLResponse
                    if responseCasting.statusCode == 500 {
                        single(.failure(HTTPError.internalError))
                    } else {
                        do {
                            self.log(data: data, from: request)
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let model: T = try decoder.decode(T.self, from: data ?? Data())
                            single(.success(model))
                        } catch let error {
                            single(.failure(HTTPError.custom(error.localizedDescription)))
                        }
                    }
                } else {
                    single(.failure(HTTPError.connectionLost))
                }
            })
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    func verify() -> RxSwift.Completable {
        return Completable.create { observer in
            return Disposables.create { }
        }
    }
    
    private func log(data: Data?, from urlRequest: URLRequest) {
        if let data = data {
            print("\n=====HTTPResponse=====")
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print("RESPONSE FROM \(urlRequest.url?.absoluteString ?? "") \n\(json)")
                }
            } catch let error {
                print("RESPONSE FROM \(urlRequest.url?.absoluteString ?? "") => \(error.localizedDescription)")
            }
            print("====================\n")
        }
    }
}
