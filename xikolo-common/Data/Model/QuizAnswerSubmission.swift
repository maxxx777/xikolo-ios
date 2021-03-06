//
//  QuizAnswerSubmission.swift
//  xikolo-ios
//
//  Created by Sebastian Brückner on 21.08.16.
//  Copyright © 2016 HPI. All rights reserved.
//

import Foundation

class QuizAnswerSubmission : NSObject, EmbeddedObject {

    var id: String?
    var text: String?

    required init(_ dict: [String : AnyObject]) {
        id = dict["id"] as? String
        text = dict["user_answer_text"] as? String
    }

    init(answer: QuizAnswer) {
        id = answer.id
    }

    func toDict() -> [String : AnyObject] {
        var dict = [String: AnyObject]()
        if let id = id {
            dict["id"] = id
        }
        if let text = text {
            dict["user_answer_text"] = text
        }
        return dict
    }

}
