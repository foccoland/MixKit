//
//  HTTPClient.swift
//  MixKit
//
//  Created by Fabio Giannelli on 28/09/23.
//

import Foundation

enum MVHTTPError {
    
    internal enum Request: Error {
        case badUrl
        case badRequestBody
    }
    
    internal enum Response: Error {
        case noResponse
        case badResponse(Int)
        case badResponseBody
    }
}

class MVHTTPClient {
    
    private init() {}
    
    static let shared = MVHTTPClient()
    
    fileprivate func execute<Res>(urlRequest: URLRequest) async throws -> Res where Res : Decodable {
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = (response as? HTTPURLResponse) else {
            throw MVHTTPError.Response.noResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            throw MVHTTPError.Response.badResponse(httpResponse.statusCode)
        }
        
        guard let responseBody = try? JSONDecoder().decode(Res.self, from: data) else {
            throw MVHTTPError.Response.badResponseBody
        }
        
        return responseBody
    }
    
    func get<Res>(mvEndpoint: MVEndpoint) async throws -> Res where Res : Decodable {
        guard let url = URL(string: "\(MVConstants.baseUrl)\(mvEndpoint.rawValue)") else {
            throw MVHTTPError.Request.badUrl
        }
        
        var urlRequest = URLRequest(url: url)
        
        return try await execute(urlRequest: urlRequest)
    }
    
    func post<Req, Res>(mvEndpoint: MVEndpoint, body requestBody: Req) async throws -> Res where Req : Encodable, Res : Decodable {
        guard let url = URL(string: "\(MVConstants.baseUrl)\(mvEndpoint.rawValue)") else {
            throw MVHTTPError.Request.badUrl
        }
        
        var urlRequest = URLRequest(url: url)
        
        do {
            urlRequest.httpBody = try JSONEncoder().encode(requestBody)
        } catch {
            throw MVHTTPError.Request.badRequestBody
        }
        
        return try await execute(urlRequest: urlRequest)
    }
}
