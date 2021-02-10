//
//  Questions.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 09/02/21.
//

import Foundation
//switflint:disable identifier_name
public struct Question: Decodable {
    let answers: [Answer]?
    let categoriesId: Int?
    let description: String?
    let questionsId: Int?
    
    enum CondingKeys: String, CodingKey {
        case answers =  "answers"
        case categoriesId = "categories_id"
        case description = "description"
        case questionsId = "questions_id"
    }
}
