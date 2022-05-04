//
//  HTTPRequest.swift
//  await
//
//  Created by Saeed on 5/4/22.
//


/// The request type that matches the URLSessionTask types.
enum RequestType {
    /// Will translate to a URLSessionDataTask.
    case data
}

/// The expected remote response type.
enum ResponseType {
    /// Used when the expected response is a JSON payload.
    case json
}

/// HTTP request methods.
enum RequestMethod: String {
    /// HTTP GET
    case get = "GET"
}
/// Type alias used for HTTP request headers.
typealias ReaquestHeaders = [String: String]
/// Type alias used for HTTP request parameters. Used for query parameters for GET requests and in the HTTP body for POST, PUT and PATCH requests.
typealias RequestParameters = [String : String]
