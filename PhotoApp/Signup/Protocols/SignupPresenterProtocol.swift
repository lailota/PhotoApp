//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by Laila Guzzon Hussein Lailota on 31/05/21.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol)
    
    func processUserSignup(formModel: SignupFormModel)
}
