//
//  APIRequestProtocolMock.swift
//  awaitTests
//
//  Created by Saeed on 6/26/22.
//

import Foundation

@testable import await

final class APIRequestProtocolMock: APIRequestProtocol {
    private enum Constants {
        static let successResponse = "{\"id\":2323,\"uid\":\"ef0abbbc-2f21-48d3-b80b-a3aef153add3\",\"platform\":\"Linux\",\"type\":\"server\",\"os\":\"Mojave (10.14)\",\"stack\":\"macOS, Mojave (10.14)\"}"
    }

    func get(request: URLRequest) async throws -> Result<Data, Error> {
        return .success(Constants.successResponse.data(using: .utf8)!)
    }
}
