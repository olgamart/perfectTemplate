//
//  ProductsListController.swift
//  PerfectTemplate
//
//  Created by Olga Martyanova on 28/01/2019.
//

import Foundation
import PerfectHTTP

class ProductsListController {
    let register: (HTTPRequest, HTTPResponse) -> () = { request, response in
        guard  request.param(name: "page_number") == "1" && request.param(name: "id_category") == "1"
            else {
                response.completed(status: HTTPResponseStatus.custom(code: 401, message: "incorrect data"))
                return
        }
        
        let responseData: Array <[String:Any]> = [
            [
                "id_product": 123,
                "product_name": "Ноутбук",
                "price": 45600
            ],
            [
                "id_product": 456,
                "product_name": "Мышка",
                "price": 1000
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
