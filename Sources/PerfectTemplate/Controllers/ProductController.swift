//
//  ProductController.swift
//  PerfectTemplate
//
//  Created by Olga Martyanova on 28/01/2019.
//

import Foundation
import PerfectHTTP

class ProductController {
    let register: (HTTPRequest, HTTPResponse) -> () = { request, response in
        guard  request.param(name: "id_product") == "123"
            else {
                response.completed(status: HTTPResponseStatus.custom(code: 401, message: "incorrect login and password"))
                return
        }
        
        let responseData: [String:Any] = [
            "result": 1,
            "product_name": "Ноутбук",
            "product_price": 45600,
            "product_description": "Мощный игровой ноутбук"
        ]
        
        do {
            try response.setBody(json: responseData, skipContentType: true)
            response.completed()
            
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Parse data error - \(error)"))
        }
    }
}
