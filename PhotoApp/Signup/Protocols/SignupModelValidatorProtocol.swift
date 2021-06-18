//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Laila Guzzon Hussein Lailota on 31/05/21.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool
    
    func isLastNameValid(lastName: String) -> Bool
    
    func isEmailValid(email: String) -> Bool
    
    func IsPasswordValid(password: String) -> Bool
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}
