//
//  FotogridController.swift
//  ImageViewer
//
//  Created by Jan Brinkmann on 06/09/15.
//  Copyright © 2015 Jan Brinkmann. All rights reserved.
//

import UIKit

class FotogridController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var fotos = [MyPhoto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let comment = "Was für ein toller Urlaub!"
        
        let bild1 = MyPhoto(bildName: "bild1", title: "Toller Urlaub",
            kommentar: comment)
        fotos.append(bild1)
        
        let bild2 = MyPhoto(bildName: "bild2", title: "Toller Strand",
            kommentar: comment)
        fotos.append(bild2)
        
        let bild3 = MyPhoto(bildName: "bild3", title: "Unter Palmen",
            kommentar: comment)
        fotos.append(bild3)
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetail" {
            let destCtrl = segue.destinationViewController as! DetailController
            
            let indexPath = sender as! NSIndexPath
            let myPhoto = fotos[indexPath.row]
            
            destCtrl.currentImage = myPhoto
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {

        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return fotos.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("fotoCell", forIndexPath: indexPath) as! FotogridCell
    
        cell.backgroundColor = UIColor.grayColor()
        
        let currentImg = UIImage(named: fotos[indexPath.row].bildName)
        cell.imageView.image = currentImg
    
        return cell
    }
    
    // MARK: FlowLayout Delegate
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var size = CGSize(width: 100, height: 100)
        
        if self.view.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Regular {
            size = CGSize(width: 150, height: 150)
        }
        
        return size
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
    }
    
    
    // MARK: UICollectionViewDelegate
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        self.performSegueWithIdentifier("showDetail", sender: indexPath)
        
        return true
    }
}
