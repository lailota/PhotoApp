//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Laila Guzzon Hussein Lailota on 28/05/21.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
