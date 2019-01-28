//
//  ExitController.swift
//  PerfectTemplate
//
//  Created by Olga Martyanova on 28/01/2019.
//

import Foundation
import PerfectHTTP

class ExitController {
    let register: (HTTPRequest, HTTPResponse) -> () = { request, response in
        guard  request.param(name: "id_user") == "123"
            else {
                response.completed(status: HTTPResponseStatus.custom(code: 403, message: "unknown user"))
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

