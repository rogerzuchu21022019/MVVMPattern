//
//  ImageExt.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 20/06/2022.
//

import Foundation
import Nuke
extension UIImageView {
    func loadUrl(_ url: String?) {
        
        ImageCache.shared.costLimit = 1024 * 1024 * 100 // 100 MB
        ImageCache.shared.countLimit = 100
        ImageCache.shared.ttl = 120 // Invalidate image after 120 sec
        let url1 = URL(string: url!)
        // Read and write images
        let request = ImageRequest(url: url1!)
        let image = ImageCache.shared[request]
        Nuke.loadImage(with: URL(string: url!)!, into: self)
    }
    
    
    func loadImageLocal(url: String) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string: url)!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self!.image = image
                    }
                }
            }
        }
    }
    
  
    
}

extension URL {
    func loadImage(_ image: inout UIImage?) {
        if let data = try? Data(contentsOf: self), let loaded = UIImage(data: data) {
            image = loaded
        } else {
            image = nil
        }
    }
    func saveImage(_ image: UIImage?) {
        if let image = image {
            if let data = image.jpegData(compressionQuality: 1.0) {
                try? data.write(to: self)
            }
        } else {
            try? FileManager.default.removeItem(at: self)
        }
    }
}
