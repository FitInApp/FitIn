//
//  ImageObject.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 4/13/23.
//

import Foundation
import ParseSwift

struct ImageObject: ParseObject {
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseSwift.ParseACL?

    var imageFile: ParseFile?
}
