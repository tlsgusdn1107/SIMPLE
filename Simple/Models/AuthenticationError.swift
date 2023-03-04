//
//  AuthenticationError.swift
//  Simple
//
//  Created by Charles Shin on 2/13/23.
//

enum AuthenticationError: Error {
    case emailFormatting
    case emailDoesNotExist
    case emailInUse
    case passwordIncorrect
    case passwordFormatting
    case unverifiedEmail
    case emailVerificationSent
    case unknown
    
    init(localizedDescription: String) {
        if localizedDescription.contains("email address is badly formatted") {
            self = .emailFormatting
        } else if localizedDescription.contains("no user record corresponding to this identifier") {
            self = .emailDoesNotExist
        } else if localizedDescription.contains("password is invalid or the user does not have a password") {
            self = .passwordIncorrect
        } else if localizedDescription.contains("The password must be 6 characters long or more") {
            self = .passwordFormatting
        } else if localizedDescription.contains("email address is already in use") {
            self = .emailInUse
        } else {
            self = .unknown
        }
    }
    
    var description: String {
        switch self {
        case .emailFormatting:
            return "The email address you have entered is not properly formatted. Please try again."
        case .emailDoesNotExist:
            return "We could not find a user with the provided email address. This account may have been deleted."
        case .emailInUse:
            return "This email address is already registered. Please choose a different email and try again, or sign in with your account."
        case .passwordIncorrect:
            return "Your password is incorrect or does not exist. Please try again."
        case .passwordFormatting:
            return "Your password must be at least 6 characters or more. Please try again."
        case .unverifiedEmail:
            return "It looks like your email hasn't been verified yet. Please check your inbox and try again, or click below the button to resend the verification link."
        case .emailVerificationSent:
            return "It looks like we already sent you an email. Please check your inbox and try again."
        case .unknown:
            return "An error occurred while searching for your account. Please try again later."
        }
    }
}