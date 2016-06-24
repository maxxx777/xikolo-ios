//
//  CourseSectionHelper.swift
//  xikolo-ios
//
//  Created by Sebastian Brückner on 11.05.16.
//  Copyright © 2016 HPI. All rights reserved.
//

import BrightFutures
import CoreData
import Result

class CourseSectionHelper {

    static private let entity = NSEntityDescription.entityForName("CourseSection", inManagedObjectContext: CoreDataHelper.managedContext)!

    static func getSectionRequest(course: Course) -> NSFetchRequest {
        let request = NSFetchRequest(entityName: "CourseSection")
        request.predicate = NSPredicate(format: "course = %@", course)
        let titleSort = NSSortDescriptor(key: "position", ascending: true)
        request.sortDescriptors = [titleSort]
        return request
    }

    static func syncCourseSections(course: Course) -> Future<[CourseSection], XikoloError> {
        return CourseSectionProvider.getCourseSections(course.id).flatMap { spineSections in
            future(context: ImmediateExecutionContext) {
                do {
                    let request = getSectionRequest(course)
                    let cdSections = try SpineModelHelper.syncObjects(request, spineObjects: spineSections, inject:["course": course], save: true)
                    return Result.Success(cdSections as! [CourseSection])
                } catch let error as XikoloError {
                    return Result.Failure(error)
                } catch {
                    return Result.Failure(XikoloError.UnknownError(error))
                }
            }
        }
    }

}
