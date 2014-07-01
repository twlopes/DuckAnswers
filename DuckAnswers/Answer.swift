//
//  Answer.swift
//  DuckAnswers
//
//  Created by Tristan Lopes on 26/06/2014.
//  Copyright (c) 2014 twlopes. All rights reserved.
//

import Foundation

class Answer: Printable {
    var abstract : String?
    var abstractSource : String?
    var abstractText : String?
    var abstractURL : NSURL?
    var answer : String?
    var answerType : String?
    var definition : String?
    var definitionSource : String?
    var definitionURL : NSURL?
    var heading : String?
    var image : String?
    var imageIsLogo : String?
    var imageWidth : Int?
    var infoBox : String?
    var redirect : String?
    var relatedTopics : RelatedTopic[]?
    var results : String[]?
    var type : String?

    var description: String {
    return "Answer: \(answer)\nRelatedTopics: \(relatedTopics)"
    }

    init(json:JSONValue) {
        abstract = json["Abstract"].string
        abstractSource = json["AbstractSource"].string
        abstractText = json["AbstractText"].string

        heading = json["Heading"].string

        relatedTopics = RelatedTopic.parseJSONArray(json["RelatedTopics"].array!)
    }
}