//
//  DetailController.swift
//  ImageViewer
//
//  Created by Jan Brinkmann on 06/09/15.
//  Copyright © 2015 Jan Brinkmann. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    var currentImage: MyPhoto?
    
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let img = UIImage(named: currentImage!.bildName)
        imageView.image = img
        
        if self.traitCollection.horizontalSizeClass == .Regular {
            titleLabel.text! = currentImage!.title
        } else {
            titleLabel.hidden = true
        }
        
        commentLabel.text! = currentImage!.kommentar
    }



}
