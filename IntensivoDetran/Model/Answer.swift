//
//  AnswerModel.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 09/02/21.
//

import Foundation
//switflint:disable identifier_name
struct Answer: Decodable {
    let categoriesId: Int?
    let correctAnswer: Bool?
    let description: String?
    let questionsId: Int?
    
    enum CodingKeys: String, CodingKey {
        case categoriesId = "categories_id"
        case correctAnswer = "correct_answer"
        case description = "description"
        case questionsId = "questions_id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let correctAnswerInt = try values.decodeIfPresent(Int.self, forKey: .correctAnswer)
        
        categoriesId = try values.decodeIfPresent(Int.self, forKey: .categoriesId)!
        correctAnswer = correctAnswerInt == 1 ? true : false
        description = try values.decodeIfPresent(String.self, forKey: .description)!
        questionsId = try values.decodeIfPresent(Int.self, forKey: .questionsId)!
    }
    
}
