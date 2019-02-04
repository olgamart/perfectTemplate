//
//  AddProductController.swift
//  PerfectTemplate
//
//  Created by Olga Martyanova on 04/02/2019.
//

import Foundation
import PerfectHTTP

class AddProductController {
    let register: (HTTPRequest, HTTPResponse) -> () = { request, response in
        guard  request.param(name: "id_product") == "123" && request.param(name: "quantity") == "1"
            else {
                response.completed(status: HTTPResponseStatus.custom(code: 401, message: "incorrect data"))
                return
        }
        
        do {
            try response.setBody(json: ["result": 1, "userMessage": "Товар был добавлен в корзину!"])
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
    }
}
