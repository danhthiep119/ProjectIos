//
//  Issue.swift
//  ProjectTechMaster
//
//  Created by Cuong DT on 12/3/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class Issue {
    var id:Int?
    var processed:String?
    var title:String?
    var address:String?
    var time:String?
    var date:String?
    
    init(id:Int, processed:String, title:String, address:String, time:String, date:String){
        self.id = id
        self.processed = processed
        self.title = title
        self.address = address
        self.time = time
        self.date = date
    }
}

//class IssueObject:Codable {
//    var resultCount:String?
//    var result = [Issue]()
//
//    static func parseData(_ data:Data) -> [Issue]{
//    do {
//            let decoder = JSONDecoder()
//            let resultObject = try decoder.decode(IssueObject.self, from: data)
//            return resultObject.result
//        }
//    catch {
//        print("JSON Error: \(error)")
//        return []
//        }
//    }
//}
