//
//  InfoListDataModel.swift
//  AxxessAssignment
//
//  Created by Dhanraj Subhash Bhandari on 28/06/20.
//  Copyright © 2020 Dhanraj Subhash Bhandari. All rights reserved.
//

import Foundation
import RealmSwift
// MARK: - InfoListDataModel
class InfoListDataModel: Object, Codable {
    @objc dynamic var id: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var date: String?
    @objc dynamic var data: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case date
        case data
    }
    
}



