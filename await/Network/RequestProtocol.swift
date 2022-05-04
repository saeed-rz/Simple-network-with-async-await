//
//  RequestProtocol.swift
//  await
//
//  Created by Saeed on 5/4/22.
//

import Foundation

/// Protocol to which the HTTP requests must conform.
protocol RequestProtocol {

    /// The path that will be appended to API's base URL.
    var path: String { get }

    /// The HTTP method.
    var method: RequestMethod { get }

    /// The HTTP headers/
    var headers: ReaquestHeaders? { get }

    /// The request parameters used for query parameters for GET requests and in the HTTP body for POST, PUT and PATCH requests.
    var parameters: RequestParameters? { get }

    /// The request type.
    var requestType: RequestType { get }

    /// The expected response type.
    var responseType: ResponseType { get }
}

extension RequestProtocol {

    /// Creates a URLRequest from this instance.
    /// Parameter environment: The environment against which the `URLRequest` must be constructed.
    /// - Returns: An optional `URLRequest`.
    public func urlRequest(with environment: EnvironmentProtocol = APIEnvironment.production) -> URLRequest? {
        // Create the base URL.
        guard let url = url(with: "\(environment.baseURL)") else {
            return nil
        }
        // Create a request with that URL.
        var request = URLRequest(url: url)

        // Append all related properties.
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = nil

        return request
    }

    /// Creates a URL with the given base URL.
    /// - Parameter baseURL: The base URL string.
    /// - Returns: An optional `URL`.
    private func url(with baseURL: String) -> URL? {
        // Create a URLComponents instance to compose the url.
        guard var urlComponents = URLComponents(string: baseURL) else {
            return nil
        }
        // Add the request path to the existing base URL path
        urlComponents.path = urlComponents.path + path
        // Add query items to the request URL
        urlComponents.queryItems = queryItems

        return urlComponents.url
    }

    /// Returns the URLRequest `URLQueryItem`
    private var queryItems: [URLQueryItem]? {
        // Chek if it is a GET method.
        guard method == .get, let parameters = parameters else {
            return nil
        }
        // Convert parameters to query items.
        return parameters.map { (key: String, value: String) -> URLQueryItem in
            let valueString = String(describing: value)
            return URLQueryItem(name: key, value: valueString)
        }
    }
}
