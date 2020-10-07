//
//  UserDefaultsManager.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

import Foundation

open class UserDefaultsManager {
    public static let shared = UserDefaultsManager()
    
    public var userDefaults: UserDefaults? = UserDefaults.standard
    
    public init() {
    }
        
    open func user() -> User? {
        guard let id = self.userDefaults?.string(forKey: Keys.User.id) else {
            return nil
        }
        let user = User(id: id)
        user.email = self.userDefaults?.string(forKey: Keys.User.email)
        user.username = self.userDefaults?.string(forKey: Keys.User.username)
        user.firstName = self.userDefaults?.string(forKey: Keys.User.firstName)
        user.lastName = self.userDefaults?.string(forKey: Keys.User.lastName)
        user.description = self.userDefaults?.string(forKey: Keys.User.description)
        user.photo = self.photo()
        return user
    }
    
    open func photo() -> Photo? {
        guard let id = self.userDefaults?.string(forKey: Keys.Photo.id) else {
            return nil
        }
        let photo = Photo(id: id)
        photo.imageName = self.userDefaults?.string(forKey: Keys.Photo.imageName)
        photo.imageUrl = self.userDefaults?.string(forKey: Keys.Photo.imageUrl)
        photo.imageDominantColor = self.userDefaults?.string(forKey: Keys.Photo.imageDominantColor)
        return photo
    }
    
    open func saveUser(_ user: User) {
        self.userDefaults?.set(user.id, forKey: Keys.User.id)
        self.userDefaults?.set(user.email, forKey: Keys.User.email)
        self.userDefaults?.set(user.username, forKey: Keys.User.username)
        self.userDefaults?.set(user.firstName, forKey: Keys.User.firstName)
        self.userDefaults?.set(user.lastName, forKey: Keys.User.lastName)
        self.userDefaults?.set(user.description, forKey: Keys.User.description)
        self.savePhoto(user.photo)
    }
    
    open func savePhoto(_ photo: Photo?) {
        self.userDefaults?.set(photo?.id, forKey: Keys.Photo.id)
        self.userDefaults?.set(photo?.imageName, forKey: Keys.Photo.imageName)
        self.userDefaults?.set(photo?.imageUrl, forKey: Keys.Photo.imageUrl)
        self.userDefaults?.set(photo?.imageDominantColor, forKey: Keys.Photo.imageDominantColor)
    }
    
    open func removeUser() {
        self.userDefaults?.removeObject(forKey: Keys.User.id)
        self.userDefaults?.removeObject(forKey: Keys.User.email)
        self.userDefaults?.removeObject(forKey: Keys.User.username)
        self.userDefaults?.removeObject(forKey: Keys.User.firstName)
        self.userDefaults?.removeObject(forKey: Keys.User.lastName)
        self.userDefaults?.removeObject(forKey: Keys.User.description)
        self.removePhoto()
    }
    
    open func removePhoto() {
        self.userDefaults?.removeObject(forKey: Keys.Photo.id)
        self.userDefaults?.removeObject(forKey: Keys.Photo.imageName)
        self.userDefaults?.removeObject(forKey: Keys.Photo.imageUrl)
        self.userDefaults?.removeObject(forKey: Keys.Photo.imageDominantColor)
    }
    
    // MARK: - Keys
    
    public enum Keys {
        public struct User {
            static let prefix = "com.travel.travelling.user"
            static let id = prefix + "id"
            static let username = prefix + "username"
            static let email = prefix + "email"
            static let firstName = prefix + "firstName"
            static let lastName = prefix + "lastName"
            static let description = prefix + "description"
        }
        
        public struct Photo {
            static let prefix = "com.travel.travelling.photo."
            static let id = prefix + "uuid"
            static let imageName = prefix + "imageName"
            static let imageUrl = prefix + "imageUrl"
            static let imageDominantColor = prefix + "imageDominantColor"
        }
    }
}
