//
//  AlbumDetailVC.swift
//  NikeChallenge
//
//  Created by Kevin Tanner on 2/5/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit
import SafariServices

class AlbumDetailVC: UIViewController {
    
    let albumCoverArtImageView = NCAlbumCoverArtImageView(frame: .zero)
    let albumNameLabel = NCTitleLabel(textAlignment: .center, fontSize: 20)
    let artistLabel = NCTitleLabel(fontSize: 16, fontWeight: .medium)
    let genreLabel = NCTitleLabel(fontSize: 14, fontWeight: .regular)
    let releaseDateLabel = NCTitleLabel(fontSize: 12, fontWeight: .regular)
    let copyrightInfoLabel = NCTitleLabel(fontSize: 10, fontWeight: .regular)
    
    let actionButton = UIButton()
    
    var album: Album?
    
    init(album: Album) {
        super.init(nibName: nil, bundle: nil)
        self.album = album
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        layoutUI()
        configureUIElements()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    func configureUIElements() {
        guard let album = album else { return }
        
        albumNameLabel.text = album.albumName
        artistLabel.text = album.artist
        genreLabel.text = album.genres.first?.genre
        releaseDateLabel.text = album.releaseDate.convertToDisplayFormat()
        copyrightInfoLabel.text = album.copyrightInfo
        
        actionButton.layer.cornerRadius = 10
        actionButton.backgroundColor = .systemGreen
        actionButton.setTitle("See Album in iTunes", for: .normal)
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
        albumCoverArtImageView.downloadImage(fromURL: album.albumCoverArt)
    }
    
    @objc func actionButtonTapped() {
        guard let album = album else { return }
        guard let albumURL = URL(string: album.albumURL) else { return }
        presentSafariVC(with: albumURL)
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    func layoutUI() {
        view.addSubViews(albumCoverArtImageView, albumNameLabel, artistLabel, genreLabel, releaseDateLabel, copyrightInfoLabel, actionButton)

        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        albumCoverArtImageView.contentMode = .scaleAspectFit
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            albumCoverArtImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            albumCoverArtImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            albumCoverArtImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            albumCoverArtImageView.heightAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),
            
            albumNameLabel.topAnchor.constraint(equalTo: albumCoverArtImageView.bottomAnchor, constant: padding),
            albumNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            albumNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            albumNameLabel.heightAnchor.constraint(equalToConstant: 80),
            
            artistLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 10),
            artistLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            artistLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            artistLabel.heightAnchor.constraint(equalToConstant: 18),
            
            genreLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 10),
            genreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            genreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            genreLabel.heightAnchor.constraint(equalToConstant: 16),
            
            releaseDateLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 10),
            releaseDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            releaseDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            releaseDateLabel.heightAnchor.constraint(equalToConstant: 14),
            
            copyrightInfoLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 10),
            copyrightInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            copyrightInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            copyrightInfoLabel.heightAnchor.constraint(equalToConstant: 36),
            
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            actionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
