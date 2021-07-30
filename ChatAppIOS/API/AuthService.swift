//
//  AuthService.swift
//  ChatAppIOS
//
//  Created by saiprasad chindam on 25/07/21.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    
    static func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    static func registerUser(withCrediantial crediantials: AuthCredentials, competion: @escaping(Error?) -> Void) {
        ImageUploader.uploadImage(image: crediantials.profileImage) { (imageUrl) in
            Auth.auth().createUser(withEmail: crediantials.email, password: crediantials.password, completion: { (result, error) in
                if let error = error {
                    print("DEBUG:============= Failed to create user \(error.localizedDescription)")
                    return
                }
                
                guard let uid = result?.user.uid else { return }
                
                let data: [String: Any] = ["email": crediantials.email,
                                           "fullname": crediantials.fullname,
                                           "profileImageURL": imageUrl,
                                           "username": crediantials.username,
                                           "uid": uid]
                Firestore.firestore().collection("users").document(uid).setData(data, completion: competion)
            })
        }
    }
}
