//
//  UserSingleten.swift
//  SnapChatBasicClone
//
//  Created by Semih Kalaycı on 31.08.2021.
//

import Foundation

class UserSingleton {
    static let sharedUserInfo = UserSingleton()
    var email = ""
    var userName = ""
    
    
    private init(){
        
    }
}
