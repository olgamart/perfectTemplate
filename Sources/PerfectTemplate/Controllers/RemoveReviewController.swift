//
//  RemoveReviewController.swift
//  COpenSSL
//
//  Created by Olga Martyanova on 31/01/2019.
//

import Foundation
import PerfectHTTP

class RemoveReviewController {
    let register: (HTTPRequest, HTTPResponse) -> () = { request, response in
        guard  request.param(name: "id_comment") == "123"
            else {
                response.completed(status: HTTPResponseStatus.custom(code: 403, message: "incorrect data"))
                return
        }
        
        do {
            try response.setBody(json: ["result": 1], skipContentType: true)
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
    }
}
