//
//  UITextField+findImage.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 17/11/23.
//

import UIKit

extension UITextField {
    func addFindImageTF(ImageViewNamed: String){
        let imageView = UIImageView (frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = UIImage(named: ImageViewNamed)
        let imageViewContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
        imageViewContainerView.addSubview(imageView)
        leftView = imageViewContainerView
        leftViewMode = .always
        self.tintColor = .lightGray
    }
}


