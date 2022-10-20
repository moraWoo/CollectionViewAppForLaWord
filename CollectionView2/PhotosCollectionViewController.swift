//
//  PhotosCollectionViewController.swift
//  CollectionView2
//
//  Created by Ildar Khabibullin on 19.10.2022.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    let itemsPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    
    let photos = ["sanfransisco", "newyork"]
    
    @IBOutlet weak var NameOfDictionary: UILabel!
    @IBOutlet weak var CountOfWordsInCurrentDictionary: UILabel!
    
    
    let labelOfSection = ["Базовые словари", "Пользовательские словари"]
    let nameOfDictionary = ["Dictionary 1", "Dictionary 2"]
    let countOfWordsInDictionary = ["1 / 100", "230 / 370"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: 70, height: 70)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = 1
//        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .vertical
        collectionView.showsVerticalScrollIndicator = false
        

        collectionView?.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        
//        collectionView?.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier)
        
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        
        cell.NameOfDictionary.text = nameOfDictionary[indexPath.row]
//        label.text = titles[indexPath.row]
        cell.CountOfWordsInCurrentDictionary.text = countOfWordsInDictionary[indexPath.row]

        
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.photosImageView.layer.cornerRadius = 15
        cell.photosImageView.layer.masksToBounds = true

        cell.photosImageView.image = image
        return cell
    }
}

extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow

        return CGSize(width: widthPerItem, height: widthPerItem)
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
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//        if kind == UICollectionView.elementKindSectionFooter {
//            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier, for: indexPath) as! FooterCollectionReusableView
//
//            footer.configure()
//            return footer
//        }
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
//        if
        
        if indexPath.section == 0 {
            header.configure(labelOfSection[0])
        } else {
            header.configure(labelOfSection[1])
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 50)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.size.width, height: 100)
//    }
}
