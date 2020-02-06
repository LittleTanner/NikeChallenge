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
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getAlbums(completed: @escaping ([Album]?) -> Void) {
        guard let baseURL = URL(string: "https://rss.itunes.apple.com/") else {
            completed(nil)
            return
        }
        
        var finalURL = baseURL
        
        finalURL.appendPathComponent("api")
        finalURL.appendPathComponent("v1")
        finalURL.appendPathComponent("us")
        finalURL.appendPathComponent("apple-music")
        finalURL.appendPathComponent("top-albums")
        finalURL.appendPathComponent("all")
        finalURL.appendPathComponent("100")
        finalURL.appendPathComponent("explicit")
        finalURL.appendPathExtension("json")
        
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, response, error) in
            if let error = error {
                print("There was an error with the url \(error) \(error.localizedDescription)")
                completed(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil)
                return
            }
            
            guard let data = data else {
                print("There was no data")
                completed(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let topLevelDict = try decoder.decode(TopLevelDict.self, from: data)
                let albums = topLevelDict.feed.results
                completed(albums)
            } catch {
                print("There was an error decoding JSON in \(#function). \n Error: \(error), \n Error Localized Description: \(error.localizedDescription)")
                completed(nil)
                return
            }
        }
        
        dataTask.resume()
    }
    
    func downloadAlbumCoverArt(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) { completed(image); return }
        
        guard let url = URL(string: urlString) else { completed(nil); return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let self = self,
                error == nil,
            let response = response as? HTTPURLResponse, response.statusCode == 200,
            let data = data,
            let image = UIImage(data: data) else { completed(nil); return }

            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
