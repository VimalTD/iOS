//
//  NetworkHelper.swift
//  Atlantica
//
//  Created by vimal devarajan on 12/07/18.
//  Copyright © 2018 vimal devarajan. All rights reserved.
//

import Foundation


class NetworkHelper {
    static var  instance:NetworkHelper? = nil
    var session = URLSession.shared
    
    open static  func getInstance()->NetworkHelper{
        if instance == nil {
            instance = NetworkHelper()
        }
        return instance!
    }
    
    func postValues(url:String,postdata:String,callBack:@escaping (_ data:Data?,_ error:Error?)->(Void)){
        session.invalidateAndCancel()
        var request = URLRequest(url: URL(string: url)!)
        session.configuration.timeoutIntervalForRequest = 5
        session = URLSession(configuration: URLSessionConfiguration.default)
        request.httpBody = postdata.data(using: .utf8)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
            }
            //            if error == nil {
            callBack(data,error)
            //}
        }
        dataTask.resume()
    }
    
    func postJSONValues(url:String,postdata:Data,callBack:@escaping (_ data:Data?,_ error:Error?)->(Void)){
        session.invalidateAndCancel()
        var request = URLRequest(url: URL(string: url)!)
        session.configuration.timeoutIntervalForRequest = 5
        session = URLSession(configuration: URLSessionConfiguration.default)
        request.httpBody = postdata
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
            }
            //            if error == nil {
            callBack(data,error)
            //}
        }
        dataTask.resume()
    }
    
    func getValues(url:String,callBack:@escaping (_ data:Data?,_ error:Error?)->(Void)) {
        var request = URLRequest(url: URL(string: url)!)
        var session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = 5
        session = URLSession(configuration: URLSessionConfiguration.default)
        request.httpMethod = "GET"
        request.setValue("text/html; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("text/html; charset=utf-8", forHTTPHeaderField: "Accept")
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            callBack(data,error)
        }
        dataTask.resume()
    }
    
    
    
    func deleteValues(url:String,callBack:@escaping (_ data:Data?,_ error:Error?)->(Void)) {
        var request = URLRequest(url: URL(string: url)!)
        var session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = 5
        session = URLSession(configuration: URLSessionConfiguration.default)
        request.httpMethod = "DELETE"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            callBack(data,error)
        }
        dataTask.resume()
    }
    func putValues(url:String,callBack:@escaping (_ data:Data?,_ error:Error?)->(Void)) {
        var request = URLRequest(url: URL(string: url)!)
        var session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = 5
        session = URLSession(configuration: URLSessionConfiguration.default)
        request.httpMethod = "PUT"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            callBack(data,error)
        }
        dataTask.resume()
    }
    
    
    
}
