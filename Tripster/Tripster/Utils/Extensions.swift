//
//  Extensions.swift
//  Tripster
//
//  Created by Andreia on 13/06/2020.
//  Copyright © 2020 penguin. All rights reserved.
//

import UIKit

extension UIImageView {
    public func setImageFromUrl(urlString: String, contentMode: UIView.ContentMode = .scaleAspectFill) {
        self.contentMode = contentMode
        guard let url = URL(string: urlString) else {
            print("Invalid image url \(urlString)")
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url) else {
                print("\(url)")
                print("Error parsing image data.")
                return
            }
            
            guard let image = UIImage(data: data) else {
                print("Error parsing image data to imageView.")
                return
            }
            
            DispatchQueue.main.async {
                self?.image = image
            }
            
        }
    }
}
