//
//  NetworkManager.swift
//  NikeChallenge
//
//  Created by Kevin Tanner on 2/5/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL = "https://rss.itunes.apple.com/"
    
    private init() {}
    
    func getAlbums(completed: @escaping ([Album]?) -> Void) {
        
    }
}
