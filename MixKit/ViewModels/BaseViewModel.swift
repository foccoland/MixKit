//
//  BaseViewModel.swift
//  MixKit
//
//  Created by Fabio Giannelli on 28/09/23.
//

import SwiftUI

typealias Response<T : Decodable> = (result: DataResult, data: T)

enum DataResult: Equatable {
    case idle
    case loading
    case error(_ code: Int?)
    case success
}

class BaseViewModel: ObservableObject {
    
    let httpClient = MVHTTPClient.shared
    
    func get<T>(
        endpoint: MVEndpoint,
        publishedResponse published: inout Response<T>
    ) async {
        published.0 = .loading
        do {
            published.1 = try await httpClient.get(mvEndpoint: endpoint)
            try await Task.sleep(nanoseconds: 3_000_000_000)
            published.0 = .success
        } catch MVHTTPError.Response.badResponse(let code) {
            published.0 = .error(code)
            print("Unexpected HTTP error calling /\(endpoint.rawValue): \(code)")
        } catch {
            print("Unexpected HTTP error")
        }
    }
}
