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
        guard  request.param(name: "id_product") == "123"
            else {
                response.completed(status: HTTPResponseStatus.custom(code: 401, message: "incorrect data"))
                return
        }
        
        let responseData: Array <[String:Any]> = [
            [
                "id_product": 123,
                "id_user": 115,
                "user_name": "Александр",
                "text": "Ноутбук хорошо подходит для офисной работы и студентам."
            ],
            [
                "id_product": 123,
                "id_user": 456,
                "user_name": "Петр",
                "text": "Ноутбук понравился. Красивый дизайн, хорошие характеристики."
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
