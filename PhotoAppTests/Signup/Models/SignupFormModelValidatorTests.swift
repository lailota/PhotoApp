//
//  SignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Laila Guzzon Hussein Lailota on 28/05/21.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {

    var sut: SignupFormModelValidator!
    
    override func setUpWithError() throws {
        sut = SignupFormModelValidator()    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    
    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Laila")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }

    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "L")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters, but it has returned TRUE")
    }
    
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "LaiilaLaiila")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters, but it has returned TRUE")
    }
    
    
    func testSignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Hussein")
        
        // Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
    }
    
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "H")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter than \(SignupConstants.lastNameMinLength) characters, but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "GHusseinGHussein")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.lastNameMaxLength) characters, but it has returned TRUE")
    }
    
    
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        // Arrange
        // Act
        let isEmailValid = sut.isEmailValid(email: "test@test.com")
        
        // Assert
        XCTAssertTrue(isEmailValid, "Provided valid email address format but validation did not pass")
    }
    
    func testSignupFormModelValidator_WhenInvalidEmailProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isEmailValid = sut.isEmailValid(email: "testtest.com")
        
        // Assert
        XCTAssertFalse(isEmailValid, "Provided invalid email address format but validation still passed")
    }
    
    
    func testSignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        // Arrange
        // Act
        let isPasswordValid = sut.IsPasswordValid(password: "123456789")
        
        // Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid password but it has returned FALSE")
    }
    
    
    func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isPasswordValid = sut.IsPasswordValid(password: "30")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is shorter than \(SignupConstants.passwordMinLength) characters, but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isPasswordValid = sut.IsPasswordValid(password: "012345678910111213")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is longer than \(SignupConstants.passwordMaxLength) characters, but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        // Arrange
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "123456789", repeatPassword: "123456789")
        
        // Assert
        XCTAssertTrue(doPasswordsMatch, "The doPasswordsMatch() should have returned TRUE for a matching password but it has returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenNotEqualPasswordsProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "123456789", repeatPassword: "0123456789")
        
        // Assert
        XCTAssertFalse(doPasswordsMatch, "The doPasswordsMatch() should have returned FALSE for not matching passwords but it has returned TRUE")
    }
    
}
