//
//  Questions.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 09/02/21.
//

import Foundation
//switflint:disable identifier_name
public struct Question: Codable {
    let answers: [Answer]
    let categories_id: Int
    let description: String
    let questions_id: Int
}
