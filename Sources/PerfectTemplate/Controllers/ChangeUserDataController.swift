//
//  ChangeUserDataController.swift
//  PerfectTemplate
//
//  Created by Olga Martyanova on 28/01/2019.
//

import Foundation
import PerfectHTTP

class ChangeUserDataController {
    let register: (HTTPRequest, HTTPResponse) -> () = { request, response in
        
        guard let str = request.postBodyString , let data = str.data(using: .utf8)
            else {
                response.completed(status: HTTPResponseStatus.custom(code: 500, message: "wrong user data"))
                return
        }
        
        do {
            
            try response.setBody(json: ["result": 1, "userMessage": "Данные пользователя успешно изменены!"])
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
    }
}

