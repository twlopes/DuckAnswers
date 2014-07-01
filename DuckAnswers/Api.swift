//
//  Api.swift
//  DuckAnswers
//
//  Created by Tristan Lopes on 26/06/2014.
//  Copyright (c) 2014 twlopes. All rights reserved.
//

import Foundation

class Api {
    let baseURLString = "http://api.duckduckgo.com"
    var appName = ""

    func queryInstantAnswer(query:String, result:(answer:Answer?, success:Bool, error:NSError?) -> Void) {

        // Create query url
        if query.isEmpty {
            result(answer: nil, success: false, error: nil)
        }
        var queryString = "\(baseURLString)?q=\(query)&format=json"
        if !appName.isEmpty {
            queryString += "&t=\(appName)"
        }

        var url = NSURL.URLWithString(queryString)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)

        let task: NSURLSessionDataTask = session.dataTaskWithURL(url, completionHandler: {(data, response, error) in

            let json = JSONValue(data)
            var answer : Answer? = Answer(json: json)

            result(answer: answer, success: error ? false : true, error: error)

            })
        task.resume()
    }
}