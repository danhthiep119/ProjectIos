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


class IssueResult: Mappable {
    var responseTime = ""
    var code = 0
    var message = ""
    var data: IssueData?

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        responseTime <- map["responseTime"]
        code <- map["code"]
        message <- map["message"]
        data <- map["data"]
    }
}

class IssueData: Mappable {
    var issues = [IssueDataDetail]()
    var issuecount = 0

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        issues <- map["result"]
        issuecount <- map["issuecount"]
    }
}


class IssueDataDetail: Mappable {
    var id:Int = 0
    var titleissue = ""
    var contentissue = ""
    var addressissue = ""
    var timeissue = ""
    var dateissue = ""
    var statusissue = ""
    var mediaissue :[String] = []

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id <- map["id"]
        titleissue <- map["title"]
        contentissue <- map["content"]
        addressissue <- map["address"]
        timeissue <- map["time"]
        dateissue <- map["date"]
        statusissue <- map["status"]
        mediaissue <- map["media"]
    }
}
