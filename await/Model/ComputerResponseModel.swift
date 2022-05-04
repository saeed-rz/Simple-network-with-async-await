//
//  ResponseModel.swift
//  await
//
//  Created by Saeed on 5/4/22.
//

struct ComputerResponseModel: Decodable {
    let id: Int
    let uid: String
    let platform: String
    let type: String
    let os: String
    let stack: String

    enum CodingKeys: String, CodingKey {
        case id
        case uid
        case platform
        case type
        case os
        case stack
    }

    var description: String {
        return "\n \n \n Platform: \(platform)\n Type: \(type) \n os: \(os) \n Stack: \(stack)"
    }
}
