//
//  ReviewsListController.swift
//  PerfectTemplate
//
//  Created by Olga Martyanova on 31/01/2019.
//

import Foundation
import PerfectHTTP

class ReviewsListController {
    let register: (HTTPRequest, HTTPResponse) -> () = { request, response in
        guard  request.param(name: "page_number") == "1"
            else {
                response.completed(status: HTTPResponseStatus.custom(code: 401, message: "incorrect data"))
                return
        }
        
        let responseData: Array <[String:Any]> = [
            [
                "id_user": 123,
                "text": "Отзыв на ноутбук"
            ],
            [
                "id_user": 456,
                "text": "Отзыв на мышку"
            ]
        ]
        
        do {
            try response.setBody(json: responseData, skipContentType: true)
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
    }
}
