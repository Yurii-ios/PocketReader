//
//  UserSettings.swift
//  PocketReader
//
//  Created by Yurii Sameliuk on 16/11/2020.
//

import UIKit

final class UserSettings {
    
    private enum SettingsKey: String {
        case userBooks
    }
    
    static var userBooks: [BookItem] {
        get {
            
            guard let savedBooks = UserDefaults.standard.object(forKey: SettingsKey.userBooks.rawValue) as? Data,
                  let decodedBooks = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedBooks) as? [BookItem] else { return []}
            return decodedBooks
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKey.userBooks.rawValue
            
            if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: newValue, requiringSecureCoding: false) {
                print(newValue)
                defaults.set(savedData, forKey: key)
            }
        }
    }
}
