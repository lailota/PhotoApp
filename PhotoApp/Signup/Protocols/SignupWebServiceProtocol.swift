//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Laila Guzzon Hussein Lailota on 31/05/21.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
