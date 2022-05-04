//
//  ComputerAPI.swift
//  await
//
//  Created by Saeed on 5/4/22.
//

import Foundation

protocol ComputerAPIProtocol {
    func fetchRandomComputer() async throws -> ComputerResponseModel?
}

enum ComputerAPIError: Error {
    case nilRequest
    case invalidResponseFormat
}

final class ComputerAPI: ComputerAPIProtocol {
    private let apiRequest: APIRequestProtocol

    init(apiRequest: APIRequestProtocol = APIRequest()) {
        self.apiRequest = apiRequest
    }

    func fetchRandomComputer() async throws -> ComputerResponseModel? {
        let request = ComputerAPIRequestProtocol.getRandomComputer
        guard let urlRequest = request.urlRequest() else {
            throw ComputerAPIError.nilRequest
        }

        let apiData = try await apiRequest.get(request: urlRequest)
        switch apiData {
        case .success(let data):
            let decoder = JSONDecoder()
            do {
                return try decoder.decode(ComputerResponseModel.self, from: data)
            } catch {
                throw ComputerAPIError.invalidResponseFormat
            }

        case .failure(let error):
            throw error
        }
    }
}
