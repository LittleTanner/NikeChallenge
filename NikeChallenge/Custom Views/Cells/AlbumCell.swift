//
//  AlbumCell.swift
//  NikeChallenge
//
//  Created by Kevin Tanner on 2/5/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {

    static let reuseID = "AlbumCell"
    
    let albumCoverArtImageView = NCAlbumCoverArtImageView(frame: .zero)
    let albumNameLabel = NCTitleLabel(textAlignment: .left, fontSize: 16)
    let artistLabel = NCTitleLabel(fontSize: 14)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(album: Album) {
        albumNameLabel.text = album.albumName
        artistLabel.text = album.artist
        albumCoverArtImageView.downloadImage(fromURL: album.albumCoverArt)
    }
    
    func configure() {
        addSubViews(albumCoverArtImageView, albumNameLabel, artistLabel)
        
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            albumCoverArtImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            albumCoverArtImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            albumCoverArtImageView.heightAnchor.constraint(equalToConstant: 70),
            albumCoverArtImageView.widthAnchor.constraint(equalToConstant: 70),
            
            albumNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            albumNameLabel.leadingAnchor.constraint(equalTo: albumCoverArtImageView.trailingAnchor, constant: padding),
            albumNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            albumNameLabel.heightAnchor.constraint(equalToConstant: 48),
            
            artistLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            artistLabel.leadingAnchor.constraint(equalTo: albumCoverArtImageView.trailingAnchor, constant: padding),
            artistLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            artistLabel.heightAnchor.constraint(equalToConstant: 22),
        ])
    }
}
