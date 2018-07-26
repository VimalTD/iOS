//
//  Model.swift
//  Atlantica
//
//  Created by vimal devarajan on 13/07/18.
//  Copyright © 2018 vimal devarajan. All rights reserved.
//

import Foundation


struct UserDetails: Codable
{
    var Id: CLong?
    var userCode: String?
    var userName: String?
    var userToken: String?
    var userPhone: String?
    var userApproved: String?
    var userActive: String?
    var dtTime: String?
}

struct History: Codable
{
    var id: CLong!
    var customerName: String!
    var Date: String!
    var workDone: String!
}

struct UserRegistration :Codable{
    var Id: Int8?
    var userCode: String?
    var userName: String?
    var userToken: String?
    var userPhone: String?
    var userApproved: String?
    var userActive: String?
    var dtTime: String?
    var userEmail: String?
    var userIsExist: Bool?
}

struct ResponseRegistration :Codable{
    var respCode: String!
    var respDesc: String!
    var userToken: String!
}
//
//public User umodel { get; set; }
//        public Customer cmodel { get; set; }
//        public Ticket ticketModel { get; set; }
//        public List<SparePart> listSpareParts { get; set; }
//        public TicketInvoice invoice { get; set; }
//        public bool emailToOffice { get; set; }//Flag to set email to office, At the time of saving this must be true as it’s required to get email in office.
//        public bool emailToCustomer

struct ServiceRequestModel :Codable{
    var Id: Int8?
    var cmodel: CustomerRequestModel?
    var ticketModel: TicketRequestModel?
    var CustEmail: String?
    var CustAddss: String?
    var CustPhone: String?
    var dtTime: String?
}


struct CustomerRequestModel :Codable{
    var Id: Int8?
    var CustCode: String?
    var CustName: String?
    var CustEmail: String?
    var CustAddss: String?
    var CustPhone: String?
    var dtTime: String?
}

struct TicketRequestModel :Codable{
    var Id: Int8?
    var CustCode: String?
    var CustName: String?
    var CustEmail: String?
    var CustAddss: String?
    var CustPhone: String?
    var dtTime: String?
}




