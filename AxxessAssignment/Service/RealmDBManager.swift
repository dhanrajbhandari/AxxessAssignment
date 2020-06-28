//
//  RealmDBManager.swift
//  AxxessAssignment
//
//  Created by Dhanraj Subhash Bhandari on 28/06/20.
//  Copyright © 2020 Dhanraj Subhash Bhandari. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    var array: [Element]? {
        return self.count > 0 ? self.map { $0 } : nil
    }
}

class RealmDBManager {
    
    static let shared = RealmDBManager()
    
    let realm : Realm = try! Realm()
    
    //MARK: - Private Method
    
    private init(){
        
        
    }
    
    //MARK: - Save Data
   @discardableResult func save(infoList: [InfoListDataModel]) -> Bool{
        
    if let checkObjs = realm.objects(InfoListDataModel.self).array{
        if checkObjs.count > 0, infoList.contains(checkObjs.first!){
            print("Already exist")
        }else{
            print("Not exist")

        }
    }
        do {
            try realm.write({
                realm.add(infoList)
            })
            return true
        }catch {
            print("Error on saving.")
            return false
        }
    }
    //MARK:- Get Data from DB
    func getInfoList() -> [InfoListDataModel]? {
        
        if let result =  realm.objects(InfoListDataModel.self).sorted(byKeyPath: "type", ascending: true).array {
            if !result.isEmpty{
                return result
            }
        }
        return nil
        
    }
}
