//
//  RichTextHelper.swift
//  xikolo-ios
//
//  Created by Sebastian Brückner on 10.06.16.
//  Copyright © 2016 HPI. All rights reserved.
//

import BrightFutures
import Foundation

class RichTextHelper {

    @discardableResult static func refresh(richText: RichText) -> Future<RichText, XikoloError> {
        return RichTextProvider.getRichText(richText.id).flatMap { (spineRichText: RichTextSpine) -> Future<[RichText], XikoloError> in
            return SpineModelHelper.syncObjectsFuture([richText], spineObjects: [spineRichText], inject: nil, save: true)
        }.map { cdRichTexts in
            return cdRichTexts[0]
        }
    }

}
