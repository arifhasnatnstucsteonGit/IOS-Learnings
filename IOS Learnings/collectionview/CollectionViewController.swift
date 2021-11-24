//
//  CollectionViewController.swift
//  IOS Learnings
//
//  Created by DREAMONLINE on 22/11/21.
//

import UIKit
import Photos

@available(iOS 14, *)
class CollectionViewController: UIViewController , PHPhotoLibraryChangeObserver{


    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var assets: PHFetchResult<AnyObject>?
    fileprivate var sideSize: CGFloat!
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
     
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         getAssets()
         

    }
     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         PHPhotoLibrary.shared().unregisterChangeObserver(self)
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationItem.title = "Gallery"
         
//         sideSize = (collectionView.bounds.width - 16) / 3
//         collectionViewLayout.itemSize = CGSize(width: sideSize, height: sideSize)
//         collectionViewLayout.minimumLineSpacing = 1
//        // collectionViewLayout.columns = 3
//         collectionViewLayout.minimumInteritemSpacing = 1
         
         configureCollectionView()
         addRightBtn()
         
         PHPhotoLibrary.shared().register(self)
     
        
    }
     
     func configureCollectionView() {
         sideSize = collectionView.bounds.width / 3
         collectionViewLayout.itemSize = CGSize(width: sideSize, height: sideSize)
         collectionViewLayout.minimumLineSpacing = 1
         collectionViewLayout.minimumInteritemSpacing = 1
     }
     
     private func addRightBtn() {
         let btn = UIButton.init(type: .custom)
         btn.setImage(UIImage.init(named: "btn_close"), for: .normal)
         btn.addTarget(self, action: #selector(close), for: .touchUpInside)
         navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
     }
     
    @objc func close() {
         self.dismiss(animated: true, completion: nil)
     }
     
     func getAssets(){
          
          if PHPhotoLibrary.authorizationStatus() == .authorized {
               DispatchQueue.main.async {
                   self.reloadAssets()
               }
            
          } else {
              PHPhotoLibrary.requestAuthorization({ (status: PHAuthorizationStatus) -> Void in
                  if status == .authorized {
                       DispatchQueue.main.async {
                           self.reloadAssets()
                       }
                  } else {
                      self.showNeedAccessMessage()
                  }
              })
          }
     }
    fileprivate func showNeedAccessMessage() {
        let alert = UIAlertController(title: "Image picker", message: "App need get access to photos", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction) -> Void in
            self.dismiss(animated: true, completion: nil)
        }))
        
        show(alert, sender: nil)
    }
    

    fileprivate func reloadAssets() {
        //activityIndicator.startAnimating()
        assets = nil
        collectionView.reloadData()

        // media type both video and photo
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate",ascending: false)]
        fetchOptions.predicate = NSPredicate(format: "mediaType = %d || mediaType = %d", PHAssetMediaType.image.rawValue, PHAssetMediaType.video.rawValue)
        let imagesAndVideos = PHAsset.fetchAssets(with: fetchOptions)
        assets = PHAsset.fetchAssets(with: fetchOptions)  as! PHFetchResult<AnyObject>
        //print("image")
        print(assets?.count)
        collectionView.reloadData()
        //activityIndicator.stopAnimating()
    }
    
     func photoLibraryDidChange(_ changeInstance: PHChange) {
         DispatchQueue.main.async {
             self.reloadAssets()
         }
     }

    
     func getAssetThumbnail(asset: PHAsset) -> UIImage {
         let manager = PHImageManager.default()
         let option = PHImageRequestOptions()
         var thumbnail = UIImage()
         option.isSynchronous = true
         manager.requestImage(for: asset, targetSize: CGSize(width: 130.0, height: 130.0), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
                 thumbnail = result!
         })
         return thumbnail
     }
    
    
}


@available(iOS 14, *)
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
     

     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.assets?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GalleryCollectionViewCell
        if let asset = self.assets?[indexPath.row] as? PHAsset {
           // cell.durationLbl.text = ""
            cell.galleryImage.image = self.getAssetThumbnail(asset: asset)
//            if asset.mediaType == .video {
//                let cmTime = CMTime(seconds: Double(asset.duration).rounded(.toNearestOrAwayFromZero), preferredTimescale: 1)
//                let durationTime = ceil(CMTimeGetSeconds(cmTime))
//                let formatedTIme = Utility.secondsToHoursMinutesSeconds(seconds: Int(durationTime))
//                let videoDuration = String(format: "%01i:%02i", formatedTIme.1, formatedTIme.2)
//                cell.durationLbl.text = "\(videoDuration)"
//                cell.durationLbl.textDropShadow()
//            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let asset = self.assets?[indexPath.row] as? PHAsset {
           // self.prepareFileModel(asset: asset)
            self.dismiss(animated: true, completion: nil)
        }
    }
     
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 100, height: 100)
     }
     
}

//@available(iOS 14, *)
//extension CollectionViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 100)
//    }
//}









