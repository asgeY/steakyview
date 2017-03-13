//
//  SAStickyHeaderView+Image.swift
//  SAStickyHeaderExample
//
//  Created by shams ahmed on 18/10/2015.
//  Copyright © 2015 SA. All rights reserved.
//

import UIKit

extension SAStickyHeaderView {
 
    // MARK:
    // MARK: UI Image
    
    func updateImageWithDirection(_ direction: UISwipeGestureRecognizerDirection) {
        var animateImage: UIImage?
        
        // loop for images and swipe them out depending on a match and direction of swipe
        for (index, element) in images.enumerated() {
            guard let first = images.first, let last = images.last else {
                assertionFailure("SAStickyHeaderView: No images have been set!")
                
                return
            }
        
            if direction == .left {
                if imageView.image == last {
                    animateImage = first
                    break
                } else if imageView.image == first {
                    animateImage = images[1]
                    break
                } else if imageView.image == element, let image = images[index+1] {
                    animateImage = image
                    break
                }
            } else if direction == .right {
                if imageView.image == last && images.count > 2 {
                    animateImage = images[images.count - 2]
                    break
                } else if imageView.image == first {
                    animateImage = last
                    break
                } else if imageView.image == element, let image = images[index-1] {
                    animateImage = image
                    break
                }
            }
        }
        
        // animate image
        UIView.transition(with: imageView, duration:0.4, options:.transitionCrossDissolve, animations: {
            self.imageView.image = animateImage
            self.imageView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    internal func updateImageWithTransformation(_ pressure: CGFloat) {
        let pressure = max(1, pressure)
        
        imageView.transform = CGAffineTransform(scaleX: pressure, y: pressure)
    }
    
    // MARK:
    // MARK: Images
    
    /// set first image whenever new images are added
    internal func didUpdateImages() {
        // add first image to imageView and display it
        guard imageView.image == nil, let firstImage = images.first else { return }
        
        imageView.image = firstImage
        imageView.transform = CGAffineTransform.identity
    }
}
