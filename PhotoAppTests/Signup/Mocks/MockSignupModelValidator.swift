//
//  MockSignupModelValidator.swift
//  PhotoAppTests
//
//  Created by Laila Guzzon Hussein Lailota on 31/05/21.
//

import Foundation
@testable import PhotoApp

class MockSignupModelValidator: SignupModelValidatorProtocol {
    
    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isEmailFormatValidated: Bool = false
    var isPasswordValidated: Bool = false
    var isPasswordEqualyValidated: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isEmailValid(email: String) -> Bool {
        isEmailFormatValidated = true
        return isEmailFormatValidated
    }
    
    func IsPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        isPasswordEqualyValidated = true
        return isPasswordEqualyValidated
    }
    
}
