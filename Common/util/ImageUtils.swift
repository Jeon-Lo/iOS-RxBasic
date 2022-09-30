//
//  ImageUtils.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/26.
//

import Foundation
import UIKit

class ImageUtils {
    private static let REQUEST_CHATTING_IMAGE_WIDTH  : CGFloat = 1024
    private static let REQUEST_CHATTING_IMAGE_HEIGHT : CGFloat = 768

    private static let REQUEST_THUMBNAIL_IMAGE_WIDTH : CGFloat = 360
    private static let REQUEST_THUMBNAIL_IMAGE_HEIGHT : CGFloat = 160
    
    private static let REQUEST_PRODUCT_IMAGE_WIDTH : CGFloat = 1280
    private static let REQUEST_PRODUCT_IMAGE_HEIGHT : CGFloat = 960

    private static let REQUEST_PROFILE_IMAGE_WIDTH : CGFloat = 320
    private static let REQUEST_PROFILE_IMAGE_HEIGHT : CGFloat = 320
    
    public static let IMAGE_PREFIX_CHATTING = "chat";
    public static let IMAGE_PREFIX_THUMBNAIL = "thumb";
    public static let IMAGE_PREFIX_PROFILE = "logo";
    public static let IMAGE_PREFIX_PRODUCT = "00";

    enum PURPOSE {
        case CHAT, PRODUCT_THUMB, PRODUCT, PROFILE
    }
    
    static func getResizedPhotoData(_ data : Data, _ purpose : PURPOSE = PURPOSE.PROFILE) -> Data? {
        do {
            guard let image = UIImage(data: data) else {
                LogEx.e("getResizedPhotoData error1")
                return nil
            }
            guard let resizedImage = ImageUtils.resize(image: image, purpose: purpose) else {
                LogEx.e("getResizedPhotoData error2")
                return nil
            }
            guard let imageData = resizedImage.jpegData(compressionQuality: 0.8) else {
                LogEx.e("getResizedPhotoData error3")
                return nil
            }
            return imageData
        }
        catch {
            LogEx.e("getResizedPhotoData error4")
            return nil
        }
    }
    
    static func resize(image: UIImage, purpose : PURPOSE) -> UIImage? {
        var scale : CGFloat = 1
        switch purpose {
        case .CHAT:
            scale = getImageScale(image, REQUEST_CHATTING_IMAGE_WIDTH, REQUEST_CHATTING_IMAGE_HEIGHT)
            break
        case .PRODUCT_THUMB:
            scale = getImageScale(image, REQUEST_THUMBNAIL_IMAGE_WIDTH, REQUEST_THUMBNAIL_IMAGE_HEIGHT)
            break
        case .PRODUCT:
            scale = getImageScale(image, REQUEST_PRODUCT_IMAGE_WIDTH, REQUEST_PRODUCT_IMAGE_HEIGHT)
            break
        case .PROFILE:
            scale = getImageScale(image, REQUEST_PROFILE_IMAGE_WIDTH, REQUEST_PROFILE_IMAGE_HEIGHT)
            break
        }
        
        let transform = CGAffineTransform(scaleX: scale, y: scale)
        let size = image.size.applying(transform)
        UIGraphicsBeginImageContext(size)
        image.draw(in: CGRect(origin: .zero, size: size))
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resultImage
    }
    
    private static func getImageScale(_ image : UIImage,_ reqWidth : CGFloat, _ reqHeight : CGFloat) -> CGFloat {
        if image.size.width <= reqWidth && image.size.height <= reqHeight {
            return 1
        }
        
        let imageWidth = image.size.width
        
        let widthScale = reqWidth / imageWidth
        return widthScale
    }
    
}
