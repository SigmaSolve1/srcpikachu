//
//  UIImageView.swift
//  RealPlans
//
//  Created by Bhuvan on 18/02/16.
//  Copyright © 2016 OpenXcell Studio. All rights reserved.
//

import Foundation
import UIKit

import UIActivityIndicator_for_SDWebImage
import SDWebImage

// MARK: - UIImageView Extension

enum PlaceHolder : String {
    case User = "avtar"
    case Logo = "hb_logo_rounded"
}

extension UIImageView {
    
    func setImage(fromStrUrl imagePathUrl: String , setPlaceholder PlaceholderImageType: PlaceHolder, usingActivityIndicatorStyle activityStyle: UIActivityIndicatorViewStyle) {
        
        //activityStyle
        self.setImageWith(URL(string: imagePathUrl), placeholderImage: UIImage(named: PlaceholderImageType.rawValue)!, options: .refreshCached, usingActivityIndicatorStyle: activityStyle)
    }
    
//    func setGIFImage(fromStrUrl imagePathUrl: String , setPlaceholder PlaceholderImageType: PlaceHolder, usingActivityIndicatorStyle activityStyle: UIActivityIndicatorViewStyle) {
//        
//        //activityStyle
//        self.setGIFImage(fromStrUrl: imagePathUrl, setPlaceholder: UIImage(named: "logo"), usingActivityIndicatorStyle: activityStyle)
//    }
    
    //http://i.giphy.com/26tnnbphrpSrCw53O.gif
    
    func checkImage(isEqualTo image2: UIImage) -> Bool {
        let data1: Data = UIImagePNGRepresentation(self.image!)!
        let data2: Data = UIImagePNGRepresentation(image2)!
        return (data1 == data2)
    }
}
