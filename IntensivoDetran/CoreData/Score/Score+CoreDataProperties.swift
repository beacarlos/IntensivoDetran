//
//  Score+CoreDataProperties.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 08/02/21.
//
//

import Foundation
import CoreData


extension Score {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Score> {
        return NSFetchRequest<Score>(entityName: "Score")
    }

    @NSManaged public var score: Float
    @NSManaged public var createdAt: Date?
    @NSManaged public var result: Int16

}

extension Score : Identifiable {

}
