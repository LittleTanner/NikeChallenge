//
//  AlbumDetailVC.swift
//  NikeChallenge
//
//  Created by Kevin Tanner on 2/5/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class AlbumDetailVC: UIViewController {
    
    let albumCoverArtImageView = UIImageView()
    let albumNameLabel = UILabel()
    let artistLabel = UILabel()
    let genreLabel = UILabel()
    let releaseDateLabel = UILabel()
    let copyrightInfoLabel = UILabel()
    
    let actionButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        layoutUI()
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    func layoutUI() {
        view.addSubViews(albumCoverArtImageView, albumNameLabel, artistLabel, genreLabel, releaseDateLabel, copyrightInfoLabel, actionButton)
        
        albumCoverArtImageView.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        copyrightInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        actionButton.layer.cornerRadius = 10
        actionButton.backgroundColor = .systemRed
        actionButton.setTitle("Action Button", for: .normal)
        
        albumCoverArtImageView.contentMode = .scaleAspectFill
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            albumCoverArtImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            albumCoverArtImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            albumCoverArtImageView.heightAnchor.constraint(equalToConstant: 100),
            albumCoverArtImageView.widthAnchor.constraint(equalToConstant: 100),
            
            albumNameLabel.topAnchor.constraint(equalTo: albumCoverArtImageView.bottomAnchor, constant: padding),
            albumNameLabel.centerYAnchor.constraint(equalTo: albumCoverArtImageView.centerYAnchor),
            albumNameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            artistLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: padding),
            artistLabel.centerYAnchor.constraint(equalTo: albumCoverArtImageView.centerYAnchor),
            artistLabel.heightAnchor.constraint(equalToConstant: 20),
            
            genreLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: padding),
            genreLabel.centerYAnchor.constraint(equalTo: albumCoverArtImageView.centerYAnchor),
            genreLabel.heightAnchor.constraint(equalToConstant: 20),
            
            releaseDateLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: padding),
            releaseDateLabel.centerYAnchor.constraint(equalTo: albumCoverArtImageView.centerYAnchor),
            releaseDateLabel.heightAnchor.constraint(equalToConstant: 20),
            
            copyrightInfoLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: padding),
            copyrightInfoLabel.centerYAnchor.constraint(equalTo: albumCoverArtImageView.centerYAnchor),
            copyrightInfoLabel.heightAnchor.constraint(equalToConstant: 20),
            
            actionButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            actionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
