//
//  ReviewController.swift
//  PerfectTemplate
//
//  Created by Olga Martyanova on 31/01/2019.
//

import Foundation
import PerfectHTTP

class ReviewController {
    let register: (HTTPRequest, HTTPResponse) -> () = { request, response in
        guard  request.param(name: "id_user") != nil && request.param(name: "text") != nil
            else {
                response.completed(status: HTTPResponseStatus.custom(code: 401, message: "incorrect data"))
                return
        }
        
        do {
            try response.setBody(json: ["result": 1, "userMessage": "Ваш отзыв был передан на модерацию!"])
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
    }
}
