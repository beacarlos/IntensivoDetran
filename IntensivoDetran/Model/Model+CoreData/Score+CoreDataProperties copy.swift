//
//  Score+CoreDataProperties.swift
//  
//
//  Created by Beatriz Carlos on 12/02/21.
//
//

import Foundation
import CoreData


extension Score {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Score> {
        return NSFetchRequest<Score>(entityName: "Score")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var result: Int16
    @NSManaged public var score: Float

}
