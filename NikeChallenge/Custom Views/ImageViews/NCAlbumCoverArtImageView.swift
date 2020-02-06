//
//  NCAlbumCoverArtImageView.swift
//  NikeChallenge
//
//  Created by Kevin Tanner on 2/6/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class NCAlbumCoverArtImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache
    let placeholderImage = Images.albumCoverArtPlaceholder

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(fromURL url: String) {
        NetworkManager.shared.downloadAlbumCoverArt(from: url) { [weak self] albumCoverArt in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.image = albumCoverArt
            }
        }
    }
}
