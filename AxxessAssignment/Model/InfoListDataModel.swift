//
//  InfoListDataModel.swift
//  AxxessAssignment
//
//  Created by Dhanraj Subhash Bhandari on 28/06/20.
//  Copyright © 2020 Dhanraj Subhash Bhandari. All rights reserved.
//

import Foundation

// MARK: - InfoListDataModel
struct InfoListDataModel: Codable {
    let id: String
    let type: TypeEnum
    let date: String?
    let data: String?
}

enum TypeEnum: String, Codable {
    case image = "image"
    case other = "other"
    case text = "text"
}

