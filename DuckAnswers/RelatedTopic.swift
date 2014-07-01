//
//  RelatedTopic.swift
//  DuckAnswers
//
//  Created by Tristan Lopes on 27/06/2014.
//  Copyright (c) 2014 twlopes. All rights reserved.
//

import Foundation

class RelatedTopic: Printable {
    var result : String?
    var firstURL : NSURL?
    var text : String?
    var topics : RelatedTopic[]?
    var icon : Icon?

    var description: String {
    return "\nResult: \(result)\n firstURL: \(firstURL)\n text: \(text)\n topics: \(topics)"
    }

    init(json : JSONValue) {
        result = json["Result"].string
        text = json["Text"].string
        icon = Icon(json: json["Icon"])

        if let relatedTopics = json["Topics"].array {
            topics = RelatedTopic.parseJSONArray(relatedTopics)
        }
    }

    class func parseJSONArray(json: JSONValue[]) -> RelatedTopic[] {
        var objectArray = RelatedTopic[]()

        for jsonValue in json {
            let topicObject : RelatedTopic = RelatedTopic(json: jsonValue)
            objectArray += topicObject
        }

        return objectArray
    }
}