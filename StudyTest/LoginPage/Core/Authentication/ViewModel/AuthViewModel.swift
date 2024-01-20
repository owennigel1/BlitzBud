//
//  AuthViewModel.swift
//  Study Buddy
//
//  Created by Darrick Chew on 18/1/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

protocol AuthenticationFormProtocol {
    var formIsValid: Bool {get}
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email:String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    fullname: String,
                    bio: String,
                    birthdate: String,
                    gender: String)
    async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email, bio: bio, birthdate: birthdate, gender: gender)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    //If there is time put in
    /*func editUserData(bio: String, birthdate: String, schoolName: String, course: String, gender: String) async throws{
        do{
            let result = try await Auth.auth().createUser(bio: , password: password)
            self.userSession = result.user
            let userdata = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("userdata").document(user.id).setData(encodedUser)
        } catch {
            print("DEBUG: Failed to save user data with error \(error.localizedDescription)")
        }
        
    }*/
    
    func signOut() {
        do {
            try Auth.auth().signOut() //signs out user on backend
            self.userSession = nil //wipes out user session and takes us back to login screen
            self.currentUser = nil //wipes out current user data model (prevents clashing of data within prev and next user)
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    

    
    func fetchUser() async{
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
    }
}
