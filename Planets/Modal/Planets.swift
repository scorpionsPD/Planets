// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let planets = try? JSONDecoder().decode(Planets.self, from: jsonData)

import Foundation
 
// MARK: - Planets
struct Planets: Codable {
    let results: [Result]?
}
// MARK: - Result
struct Result: Codable {
    let name: String?
    enum CodingKeys: CodingKey {
        case name
    }
}
