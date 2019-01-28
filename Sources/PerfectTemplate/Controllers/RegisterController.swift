//
//  RegisterController.swift
//  PerfectTemplate
//
//  Created by Olga Martyanova on 28/01/2019.
//

import Foundation
import PerfectHTTP

class RegisterController {
    let register: (HTTPRequest, HTTPResponse) -> () = { request, response in
        
        guard  request.param(name: "id_user") == "123" &&
            request.param(name: "username") != nil &&
            request.param(name: "password") != nil &&
            request.param(name: "email") != nil &&
            request.param(name: "gender") != nil &&
            request.param(name: "credit_card") != nil &&
            request.param(name: "bio") != nil
            else {
                response.completed(status: HTTPResponseStatus.custom(code: 500, message: "wrong user data"))
                return
        }
        
        do {
            
            try response.setBody(json: ["result": 1, "userMessage": "Регистрация прошла успешно!"])
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
    }
}
