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
        
        albumCoverArtImageView.image = UIImage(systemName: "folder")
        albumNameLabel.text = "Album Name"
        albumNameLabel.textAlignment = .center
        
        artistLabel.text = "Artist Name"
        artistLabel.textAlignment = .center
        
        genreLabel.text = "Genre"
        genreLabel.textAlignment = .center
        
        releaseDateLabel.text = "Release Date"
        releaseDateLabel.textAlignment = .center
        
        copyrightInfoLabel.text = "Copyright Info"
        copyrightInfoLabel.textAlignment = .center
        
        actionButton.setTitle("Action Button", for: .normal)
        
        albumCoverArtImageView.contentMode = .scaleAspectFit
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            albumCoverArtImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            albumCoverArtImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            albumCoverArtImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            albumCoverArtImageView.heightAnchor.constraint(equalTo: view.widthAnchor),
            
            albumNameLabel.topAnchor.constraint(equalTo: albumCoverArtImageView.bottomAnchor, constant: padding),
            albumNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            albumNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            albumNameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            artistLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: padding),
            artistLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            artistLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            artistLabel.heightAnchor.constraint(equalToConstant: 20),
            
            genreLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: padding),
            genreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            genreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            genreLabel.heightAnchor.constraint(equalToConstant: 20),
            
            releaseDateLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: padding),
            releaseDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            releaseDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            releaseDateLabel.heightAnchor.constraint(equalToConstant: 20),
            
            copyrightInfoLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: padding),
            copyrightInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            copyrightInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            copyrightInfoLabel.heightAnchor.constraint(equalToConstant: 20),
            
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            actionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
