//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by Laila Guzzon Hussein Lailota on 31/05/21.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignUp()
    func errorHandler(error: SignupError)
}
