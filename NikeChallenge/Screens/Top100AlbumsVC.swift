//
//  Top100AlbumsVC.swift
//  NikeChallenge
//
//  Created by Kevin Tanner on 2/5/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class Top100AlbumsVC: UIViewController {
    
    let tableView = UITableView()
    
    var albums: [Album] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        configureTableView()
        NetworkManager.shared.getAlbums { [weak self] (albums) in
            guard let self = self else { return }
            guard let albums = albums else { return }
            self.albums = albums
        }
    }

    func configureNavigationBar() {
        self.title = "Top 100 Albums"
        
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(AlbumCell.self, forCellReuseIdentifier: AlbumCell.reuseID)
    }
}

extension Top100AlbumsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.reuseID) as? AlbumCell else { return UITableViewCell() }
        
        let album = albums[indexPath.row]
        cell.set(album: album)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAlbumCell = indexPath.row
        let destVC = AlbumDetailVC()
        
        navigationController?.pushViewController(destVC, animated: true)
    }
}
