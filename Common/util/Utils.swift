//
//  Utils.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/26.
//

import UIKit

class Utils {
    static func openUrlInWebBrowser(_ vc : UIViewController, _ strUrl : String) {
        if let url = URL(string: strUrl) {
            self.openUrlInWebBrowser(url)
        } else {
            Toast.init(text: "url : \(strUrl) \n 주소가 잘못 되었습니다.").show()
        }
    }
    static func openUrlInWebBrowser(_ url : URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    static func topViewController()-> UIViewController{
        var topViewController:UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        
        while ((topViewController.presentedViewController) != nil) {
            topViewController = topViewController.presentedViewController!;
        }
        
        return topViewController
    }
    
    static func showShareActivity(msg:String?, image:UIImage?, url:String?, sourceRect:CGRect?){
        var objectsToShare = [AnyObject]()
        
        if let url = url {
            objectsToShare = [url as AnyObject]
        }
        
        if let image = image {
            objectsToShare = [image as AnyObject]
        }
        
        if let msg = msg {
            objectsToShare = [msg as AnyObject]
        }
        
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.modalPresentationStyle = .fullScreen
        activityVC.popoverPresentationController?.sourceView = topViewController().view
        if let sourceRect = sourceRect {
            activityVC.popoverPresentationController?.sourceRect = sourceRect
        }
        activityVC.completionWithItemsHandler = { (type,completed,items,error) in
            if let error = error {
                Toast.init(text: "링크 공유에 실패 하였습니다.\n잠시 후 다시 시도 해주세요. ErrorMsg : \(error.localizedDescription)").show()
                topViewController().dismissKeyboard()
                return
            }
            if completed {
                Toast.init(text: "링크 공유가 완료 되었습니다.").show()
                topViewController().dismissKeyboard()
            }
//            DispatchQueue.main.async {
//                UINavigationBar.appearance().isHidden = true
//            }
        }
        topViewController().present(activityVC, animated: true) {
//            DispatchQueue.main.async {
//                UINavigationBar.appearance().isHidden = false
//            }
        }
    }
    
}
