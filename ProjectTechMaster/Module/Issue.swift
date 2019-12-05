//
//  Issue.swift
//  ProjectTechMaster
//
//  Created by Cuong DT on 12/3/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import Foundation
import Alamofire

class ListIssue:Codable {
    var id:Int?
    var processed:String?
    var title:String?
    var add:String?
    var time:String?
    var date:String?
}

class ListIssueObject:Codable {
    var resultCount:String?
    var result = [Issue]()
    
    static func parseData(_ data:Data) -> [Issue]{
    do {
            let decoder = JSONDecoder()
            let resultObject = try decoder.decode(ListIssueObject.self, from: data)
            return resultObject.result
        }
    catch {
        print("JSON Error: \(error)")
        return []
        }
    }
}
