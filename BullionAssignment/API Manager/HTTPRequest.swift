//
//  HTTPRequest.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 11/07/24.
//

import Foundation

enum HeaderType {
    case basic
    case formData(boundary: String)
}

protocol HTTPRequest {
    var method: HTTPMethod { get set }
    var endPoint: String { get }
    var parameter: [String: Any] { get }
    var authentication: HTTPAuth.tokenType { get set }
    var header: HeaderType { get set }
}

extension HTTPRequest {
    func request(with baseUrl: URL) -> URLRequest {
        let url = "\(baseUrl.absoluteString)/api/v1/\(self.endPoint)"
        let finalUrl = URL(string: url)
        var request = finalUrl!.setParameter(parameters: parameter, method: method)
        request.httpMethod = self.method.rawValue
        print("\n=====HTTPRequest=====")
        print("HEADER = \(String(describing: request.allHTTPHeaderFields))")
        if let body = request.httpBody {
            do {
                if let json = try JSONSerialization.jsonObject(with: body, options: []) as? [String: Any] {
                    print("BODY = \(json)")
                }
            } catch let error {
                print(error)
            }
        }
        print("URL = \(String(describing: request.url?.absoluteString))")
        return request
    }
}


