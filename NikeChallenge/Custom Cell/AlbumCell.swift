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
    
    let albumCoverArtImageView = UIImageView()
    let albumNameLabel = UILabel()
    let artistLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubViews(albumCoverArtImageView, albumNameLabel, artistLabel)
        albumCoverArtImageView.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            albumCoverArtImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            albumCoverArtImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            albumCoverArtImageView.heightAnchor.constraint(equalToConstant: 70),
            albumCoverArtImageView.widthAnchor.constraint(equalToConstant: 70),
            
            albumNameLabel.topAnchor.constraint(equalTo: albumCoverArtImageView.topAnchor, constant: padding),
            albumNameLabel.leadingAnchor.constraint(equalTo: albumCoverArtImageView.trailingAnchor, constant: padding),
            albumNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: padding),
            albumNameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            artistLabel.bottomAnchor.constraint(equalTo: albumCoverArtImageView.bottomAnchor),
            artistLabel.leadingAnchor.constraint(equalTo: albumCoverArtImageView.trailingAnchor, constant: padding),
            artistLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: padding),
            artistLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
