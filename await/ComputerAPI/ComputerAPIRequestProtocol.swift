//
//  ComputerAPIRequest.swift
//  await
//
//  Created by Saeed on 5/4/22.
//

import Foundation

enum ComputerAPIRequestProtocol {
    case getRandomComputer
}

extension ComputerAPIRequestProtocol: RequestProtocol {
    var path: String {
        switch self {
        case .getRandomComputer:
            return "/computer/random_computer"
        }
    }

    var method: RequestMethod {
        switch self {
        case .getRandomComputer:
            return .get
        }
    }

    var headers: ReaquestHeaders? {
        nil
    }

    var parameters: RequestParameters? {
        nil
    }

    var requestType: RequestType {
        return .data
    }

    var responseType: ResponseType {
        return .json
    }
}
