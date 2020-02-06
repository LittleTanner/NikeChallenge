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
        
        // Final Endpoint https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json
        
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
        
//        print(finalURL)
        
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
    
    func getAlbumCoverArt(for URLString: String, completion: @escaping (UIImage?) -> Void) {

        guard let albumCoverArtURL = URL(string: URLString) else { completion(nil); return}
        
        print(albumCoverArtURL)
        
        let dataTask = URLSession.shared.dataTask(with: albumCoverArtURL) { (data, _, error) in
            
            if let error = error {
                completion(nil)
                print("Error requesting image: \(error) \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { completion(nil); return}
            
            guard let albumCoverArt = UIImage(data: data) else { completion(nil); return }
            
            completion(albumCoverArt)
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
