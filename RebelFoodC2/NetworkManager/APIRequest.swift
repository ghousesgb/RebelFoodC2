//
//  APIRequest.swift
//
//  Created by Ghouse Basha Shaik on 18/07/18.
//

import Foundation
class APIRequest {
    var urlString : String = ""
    var httpMethod : String = "GET"
    var headers : [String:String]? = ["Accept":"application/json"]
    var parameters:  [String:Any]? = nil //[:] //AnyObject?
    var httpBody: Data? = nil
}
