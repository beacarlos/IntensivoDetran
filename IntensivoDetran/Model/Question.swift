//
//  Questions.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 09/02/21.
//

import Foundation

// MARK: - Question
struct Question: Codable {
    let questionsID: Int
    let questionDescription: String
    let categoriesID: Int
    let answers: [Question]?
    let correctAnswer: Int?

    enum CodingKeys: String, CodingKey {
        case questionsID
        case questionDescription
        case categoriesID
        case answers
        case correctAnswer
    }
}

// MARK: Question convenience initializers and mutators

extension Question {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Question.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        questionsID: Int? = nil,
        questionDescription: String? = nil,
        categoriesID: Int? = nil,
        answers: [Question]?? = nil,
        correctAnswer: Int?? = nil
    ) -> Question {
        return Question(
            questionsID: questionsID ?? self.questionsID,
            questionDescription: questionDescription ?? self.questionDescription,
            categoriesID: categoriesID ?? self.categoriesID,
            answers: answers ?? self.answers,
            correctAnswer: correctAnswer ?? self.correctAnswer
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

typealias Questions = [Question]

extension Array where Element == Questions.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Questions.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
