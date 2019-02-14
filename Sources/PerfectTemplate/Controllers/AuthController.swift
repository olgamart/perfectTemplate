//
//  AuthController.swift
//  PerfectTemplate
//
//  Created by Olga Martyanova on 28/01/2019.
//

import Foundation
import PerfectHTTP

class AuthController {
    let register: (HTTPRequest, HTTPResponse) -> () = { request, response in
        guard  request.param(name: "username") != "" && request.param(name: "password") != ""
            else {
                response.completed(status: HTTPResponseStatus.custom(code: 401, message: "incorrect login and password"))
                return
        }
        
        let responseData: [String:Any] = [
            "result": 1,
            "user": ["id_user": 1,
                     "user_login": "admin",
                     "user_name": "Jon",
                     "user_lastname": "Smith"
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
