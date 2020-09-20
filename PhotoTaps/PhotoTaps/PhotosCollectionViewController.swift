//
//  PhotosCollectionViewController.swift
//  PhotoTaps
//
//  Created by Павел Чернышев on 19.09.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    let photos = ["dog1", "dog2", "dog3", "dog4", "dog5", "dog6", "dog7", "dog8", "dog9", "dog10", "dog11", "dog12", "dog13", "dog14", "dog15"]
    let itemsPerRow: CGFloat = 2;
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.showsVerticalScrollIndicator = false
//        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
//        let screenWidth = collectionView.frame.width
//        let itemsPerRow: CGFloat = 2;
//        let itemsSpecing: CGFloat = 20;
//        let allSpacingWidth = itemsSpecing * (itemsPerRow + 1)
//        let cellSize = (screenWidth - allSpacingWidth) / itemsPerRow
//        layout.itemSize = CGSize(width: cellSize, height: cellSize)
//        layout.sectionInset = UIEdgeInsets(top: itemsSpecing, left: itemsSpecing, bottom: itemsSpecing, right: itemsSpecing)
//        layout.minimumLineSpacing = itemsSpecing
//        layout.minimumInteritemSpacing = itemsSpecing
//        layout.scrollDirection = .vertical
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count 
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.backgroundColor = .black
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        cell.imageView.image = image
            
        return cell
    }


}

extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.frame.width
        let itemsSpecing: CGFloat = sectionInserts.left;
        let allSpacingWidth = itemsSpecing * (itemsPerRow + 1)
        let cellSize = (screenWidth - allSpacingWidth) / CGFloat(itemsPerRow)

        return CGSize(width: cellSize, height: cellSize)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}
 
