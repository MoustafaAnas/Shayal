//
//  User Model.swift
//  Shayal
//
//  Created by Moustafa Anas on 01/05/2022.

import Foundation

// MARK: - UserData
struct UserModel: Codable {
    let status: Bool
    let data: UserDataModel
}

// MARK: - UserDataModel
struct UserDataModel: Codable {
    let id: Int
    let name, companyName, commercialNumber : String?
    let phone: String?
    let email: String?
    let commercialImage, licenceImage, image: String?
    let address, lat, lng, landline: String?
    let companies: [Company]?
    let token: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case companyName = "company_name"
        case commercialNumber = "commercial_number"
        case phone, email
        case commercialImage = "commercial_image"
        case licenceImage = "licence_image"
        case image, address, lat, lng, landline, companies, token
    }
}

// MARK: - Company
struct Company: Codable {
    let id: Int
    let name, phone, email: String
    let image: String?
}

