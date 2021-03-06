//
//  main.swift
//  PerfectTemplate
//
//  Created by Kyle Jessup on 2015-11-05.
//	Copyright (C) 2015 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectHTTP
import PerfectHTTPServer

// An example request handler.
// This 'handler' function can be referenced directly in the configuration below.
func handler(request: HTTPRequest, response: HTTPResponse) {
	// Respond with a simple message.
	response.setHeader(.contentType, value: "text/html")
	response.appendBody(string: "<html><title>Hello, world!</title><body>Hello, world!</body></html>")
	// Ensure that response.completed() is called when your processing is done.
	response.completed()
}

// Configure one server which:
//	* Serves the hello world message at <host>:<port>/
//	* Serves static files out of the "./webroot"
//		directory (which must be located in the current working directory).
//	* Performs content compression on outgoing data when appropriate.
var routes = Routes()
let authController = AuthController()
let exitController = ExitController()
let registerController = RegisterController()
let changeUserDataController = ChangeUserDataController()
let productController = ProductController()
let productsListController = ProductsListController()
let reviewController = ReviewController()
let removeReviewController = RemoveReviewController()
let reviewsListController = ReviewsListController()
let addProductController = AddProductController()
let deleteProductController = DeleteProductController()
let orderPaymentController = OrderPaymentController()

routes.add(method: .get, uri: "/", handler: handler)

routes.add(method: .post, uri: "/login", handler: authController.register)
routes.add(method: .get, uri: "/logout", handler: exitController.register)
routes.add(method: .post, uri: "/registerUser", handler: registerController.register)
routes.add(method: .post, uri: "/changeUserData", handler: changeUserDataController.register)
routes.add(method: .get, uri: "/getGoodById", handler: productController.register)
routes.add(method: .get, uri: "/catalogData", handler: productsListController.register)
routes.add(method: .post, uri: "/addReview", handler: reviewController.register)
routes.add(method: .get, uri: "/removeReview", handler: removeReviewController.register)
routes.add(method: .get, uri: "/reviewsList", handler: reviewsListController.register)
routes.add(method: .get, uri: "/addToBasket", handler: addProductController.register)
routes.add(method: .get, uri: "/deleteFromBasket", handler: deleteProductController.register)
routes.add(method: .post, uri: "/orderPayment", handler: orderPaymentController.register)

routes.add(method: .get, uri: "/**",
		   handler: StaticFileHandler(documentRoot: "./webroot", allowResponseFilters: true).handleRequest)
try HTTPServer.launch(name: "localhost",
					  port: 8181,
					  routes: routes,
					  responseFilters: [
						(PerfectHTTPServer.HTTPFilter.contentCompression(data: [:]), HTTPFilterPriority.high)])

