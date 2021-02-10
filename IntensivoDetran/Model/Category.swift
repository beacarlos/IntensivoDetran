// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let categories = try Categories(json)

import Foundation

struct Categories: Decodable {
    let categoriesId: Int?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case categoriesId = "categories_id"
        case name = "name"
    }
}
