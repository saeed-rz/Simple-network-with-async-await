//
//  awaitTests.swift
//  awaitTests
//
//  Created by Saeed on 6/26/22.
//

import XCTest

@testable import await

final class ComputerAPITests: XCTestCase {
    var sut: ComputerAPIProtocol!
    var apiRequestMock: APIRequestProtocol!

    override func setUpWithError() throws {
        apiRequestMock = APIRequestProtocolMock()
        sut = ComputerAPI(apiRequest: apiRequestMock)
    }

    func testDecodeResponse() async throws {
        let response = try await sut.fetchRandomComputer()
        XCTAssertNotNil(response)
    }
}
