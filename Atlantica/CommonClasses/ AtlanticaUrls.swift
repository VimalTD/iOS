//
//  Urls.swift
//  Atlantica
//
//  Created by vimal devarajan on 12/07/18.
//  Copyright © 2018 vimal devarajan. All rights reserved.
//

import Foundation

let baseURL = "http://atlantic.dyndns-ip.com:8080/atlantic/"

class AtlanticaUrls {
    let loginUrl:String = baseURL+"api-datastreaming/getuserdatabyempcodeasync?empCode="
    let workHistoryUrl = baseURL+"api-datastreaming/getworkhistoryasync?userToken="
    let userRegistration = baseURL + "api-datastreaming/setuserdata"
    let resendMail = baseURL + "/api-datastreaming/resendemailasync?"
    let getTicketUrl = "/api-datastreaming/getticketasync?userToken="
    
}
