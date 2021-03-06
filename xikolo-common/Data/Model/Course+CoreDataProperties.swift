//
//  Course+CoreDataProperties.swift
//  xikolo-ios
//
//  Created by Sebastian Brückner on 26.08.16.
//  Copyright © 2016 HPI. All rights reserved.
//

import CoreData
import UIKit

extension Course {

    @NSManaged var abstract: String?
    @NSManaged var accessible_int: NSNumber?
    @NSManaged var course_description: String?
    @NSManaged var certificates: CourseCertificates?
    @NSManaged var end_at: Date?
    @NSManaged var id: String
    @NSManaged var image_url: URL?
    @NSManaged var language: String?
    @NSManaged var slug: String?
    @NSManaged var start_at: Date?
    @NSManaged var teachers: String?
    @NSManaged var title: String?
    @NSManaged var order: NSNumber?
    @NSManaged var status: String?
    @NSManaged var hidden_int: NSNumber?
    @NSManaged var enrollable_int: NSNumber?
    @NSManaged var external_int: NSNumber?
    @NSManaged var sections: NSSet?
    @NSManaged var news: NSSet?
    @NSManaged var enrollment: Enrollment?
    @NSManaged var dates: NSSet?

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course");
    }

}
