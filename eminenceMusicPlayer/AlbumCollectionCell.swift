//
//  AlbumCollectionCell.swift
//  eminenceMusicPlayer
//
//  Created by Magfurul Abeer on 9/30/16.
//  Copyright © 2016 Magfurul Abeer. All rights reserved.
//

import UIKit

class AlbumCollectionCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView?
    let musicManager = MusicManager.sharedManager
    weak var viewController: UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.collectionView = UICollectionView(frame: self.contentView.frame, collectionViewLayout: UICollectionViewLayout() )
        setUpCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCollectionView() {
        print("TEST TEST TEST")
        if let flowLayout = collectionView!.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = 10
            flowLayout.itemSize = CGSize(width: 100, height: 100)
        }
        collectionView!.delegate = self
        collectionView!.dataSource = self
    
        collectionView?.isPrefetchingEnabled = false
        collectionView!.backgroundColor = UIColor.black
        contentView.addSubview(collectionView!)
//        collectionView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        collectionView!.register(UINib(nibName: "AlbumCell", bundle: Bundle.main), forCellWithReuseIdentifier: "AlbumCell")
        
        collectionView!.translatesAutoresizingMaskIntoConstraints = false
        collectionView!.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        collectionView!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView!.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("sect")
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("tems?")
        print(musicManager.albumList.count)
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("cellforitem")
        let contentViewWidth = contentView.frame.width
        let album = musicManager.albumList[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
        cell.albumImage = album.representativeItem?.artwork?.image(at: CGSize(width: contentViewWidth/2, height: contentViewWidth/2)) ?? #imageLiteral(resourceName: "NoAlbumImage")
        cell.albumTitle = album.representativeItem!.albumTitle ?? "Untitled Album"
        cell.artist = album.representativeItem!.albumArtist ?? album.representativeItem!.artist ?? "Unknown Artist"
        cell.backgroundColor = UIColor.blue
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let contentViewWidth = contentView.frame.width
//        let dimension = (contentViewWidth - 10)/2
        return CGSize(width: 10, height: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}