//
//  UIViewController.swift
//  ChangoTuri
//
//  Created by 전종훈 on 2021/08/26.
//

import UIKit
import RxFlow
import RxCocoa
import ObjectMapper
import Alamofire
import RxAlamofire
import RxCocoa
import RxSwift
import Photos

extension UIViewController {
    /*
    func showMessageDialog( _ title : String, _ desc : String, _ positiveDelegator : (() -> Void)?,
                           _ negativeDelegator : (() -> Void)?) {
        let dialog = CommonDialog.instantiate(self.view) as! CommonDialog
        dialog.configureWithData(title, desc) {
            if let pDelegator = positiveDelegator {
                pDelegator()
            }
            dialog.removeFromSuperview()
        } negativeDelegator: {
            if let nDelegator = negativeDelegator {
                nDelegator()
            }
            dialog.removeFromSuperview()
        }
        dialog.show()
    }
    
    func showRequireLoginDialog(_ steps : PublishRelay<Step>, _ v : UIView? = nil) {
        let view = v == nil ? self.view : v!
        let dialog = CommonDialog.instantiate(view) as! CommonDialog
        dialog.configureWithData("로그인 필요", "로그인이 필요한 메뉴입니다.\n로그인 또는 회원가입 하시겠습니까?") {
            steps.accept(AppStep.login)
            dialog.removeFromSuperview()
        } negativeDelegator: {
            dialog.removeFromSuperview()
        }
        dialog.show()
    }
    
    func showCameraPermissionDialog() {
        LogEx.e("showCameraPermissionDialog")
        let dialog = CommonDialog.instantiate(self.view) as! CommonDialog
        dialog.configureWithData("지쉐어몰 권한 설정", "현재 카메라 기능의 권한 설정이 차단되어 있습니다." +
                                 "\n카메라 권한 설정이 차단되어있으면 상품등록," +
                                 "\n채팅, 정보 수정페이지 등에서 카메라 기능을 사용할 수 없습니다." +
                                 "\n권한 설정 화면으로 이동하겠습니까?", "다시보지 않기") {
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                dialog.removeFromSuperview()
            }
        } negativeDelegator: {
            dialog.removeFromSuperview()
        } checkDelegator: { isChecked in
            
        }
        dialog.show()
    }
    
    func showAlbumPermissionDialog() {
        LogEx.e("showCameraPermissionDialog")
        let dialog = CommonDialog.instantiate(self.view) as! CommonDialog
        dialog.configureWithData("지쉐어몰 권한 설정", "현재 앨범 사용 권한 설정이 차단되어 있습니다." +
                                 "\n앨범 사용 권한 설정이 차단되어있으면 상품등록," +
                                 "\n채팅, 정보 수정페이지 등에서 앨범보기 및 사진 선택기능을 사용할 수 없습니다." +
                                 "\n권한 설정 화면으로 이동하겠습니까?", "다시보지 않기") {
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                dialog.removeFromSuperview()
            }
        } negativeDelegator: {
            dialog.removeFromSuperview()
        } checkDelegator: { isChecked in
            
        }
        dialog.show()
    }
    
    //앨범 권한 묻기
    func requestAlbumAccess(completionHandler handler: @escaping () -> Void) {
        PHPhotoLibrary.checkAuthorizationStatus {
            
            if $0 {
                DispatchQueue.main.async {
                    handler()
                }
            }
            else {
                DispatchQueue.main.async {
                    self.showAlbumPermissionDialog()
                }
            }
            
        }
    }
    
    //카메라 권한 묻기
    func requestCameraAccess(completionHandler handler: @escaping () -> Void) {
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { (response) in
            
            if response {
                DispatchQueue.main.async {
                    handler()
                }
                //권한 획득시 실행될 명령
            } else {
                DispatchQueue.main.async {
                    self.showCameraPermissionDialog()
                }
            }
        })
    }*/
}

class UIViewStepController : UIViewController {
    var steps = PublishRelay<Step>()
    /*
    var isValidSession = true
    
    @IBOutlet weak var scrollView : UIScrollView?
    var activeField : UIView? = nil
    
    let activityIndicatorView = UIActivityIndicatorView(style: .medium)
    var activityIndicator: UIActivityIndicatorView?
    
    
    public func showLoadingIndicator(_ progressColor : UIColor = UIColor.black, _ alpha : CGFloat = 0.7) {
        activityIndicator = UIActivityIndicatorView.init(style: .medium)
        activityIndicator!.frame = CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height)
        activityIndicator!.hidesWhenStopped = true
        activityIndicator!.startAnimating()
        activityIndicator!.color = progressColor
        activityIndicator!.backgroundColor = UIColor.init(white: 0, alpha: alpha)
        self.view.addSubview(activityIndicator!)
    }
    
    public func hideLoadingIndicator() {
        self.activityIndicator?.removeFromSuperview()
        self.activityIndicator = nil
    }
    
    //TODO 나중에 좀더 정교한 처리 적용 필요
    override func keyboardWillShow(_ notification: Notification) {
        guard let _ = self.activeField , let scv = scrollView else {
            return
        }
        
        guard let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardFrame.height, right: 0.0)
        scv.contentInset = contentInsets
        scv.scrollIndicatorInsets = contentInsets
        
        /*
         let activePosition =  aField.frame;
         var container = CGRect(origin: scv.contentOffset - keyboardFrame.height, size: scv.frame.size)
         if(!activePosition.intersects(container))
         {
         if let textView = aField as? UITextView {
         guard let superView = textView.superview else {
         return
         }
         LogEx.e("textView yes")
         LogEx.e("aField frame y      : \(superView.frame.origin.y)")
         LogEx.e("aField frame height : \(superView.frame.height)")
         scv.setContentOffset(CGPoint.init(x: 0,y: (superView.frame.origin.y + superView.frame.height) - keyboardFrame.height), animated: true)
         }
         else {
         LogEx.e("textView no")
         LogEx.e("aField frame y      : \(aField.frame.origin.y)")
         LogEx.e("aField frame height : \(aField.frame.height)")
         scv.setContentOffset(CGPoint.init(x: 0,y: aField.frame.origin.y +  aField.frame.height), animated: true)
         }
         //            let point = scv.convert(CGPoint.init(x: 0, y: aField.frame.origin.y), from: scv)
         
         //            scv.setContentOffset(scv.convert(CGPoint.init(x: 0, y: aField.frame.origin.y), from: scv), animated: true)
         //            scv.scrollRectToVisible(aField.frame, animated: true)
         // This view has been scrolled on screen
         }*/
        /*
         var aRect : CGRect = self.view.frame
         aRect.size.height -= keyboardFrame.size.height
         if (!aRect.contains(aField.frame)) {
         scv.setContentOffset(scv.convert(CGPoint.init(x: aField.frame.origin.x, y: aField.frame.origin.y), from: scv), animated: true)
         //            scv.scrollRectToVisible(aField.frame, animated: true)
         }*/
        
        
        /*
         var rect = self.view.frame
         rect.size.height -= keyboardFrame.height
         if rect.contains(aField.frame.origin) {
         scv.setContentOffset(CGPoint.init(x: 1, y: rect.size.height - keyboardFrame.height), animated: true)
         }*/
        
        
        // 활성화된 텍스트 필드가 키보드에 의해 가려진다면 가려지지 않도록 스크롤한다.
        // 이 부분은 상황에 따라 불필요할 수 있다.
        
        
        
        
        //        scv.setContentOffset(CGPoint.init(x: 1, y: 200), animated: true)
        //            scv.scrollRectToVisible(aField.frame, animated: false)
        //        }
        
    }
    
    override func keyboardWillHide(_ notification: Notification) {
        
        guard let scv = scrollView else {
            return
        }
        let contentInsets = UIEdgeInsets.zero
        scv.contentInset = contentInsets
        scv.scrollIndicatorInsets = contentInsets
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        addObserverKeyboard()
        if let scv = scrollView {
            let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scrollViewTouchBegan))
            singleTapGestureRecognizer.numberOfTapsRequired = 1
            singleTapGestureRecognizer.isEnabled = true
            singleTapGestureRecognizer.cancelsTouchesInView = false
            scv.addGestureRecognizer(singleTapGestureRecognizer)
            scv.delaysContentTouches = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationUtils.register(self, "onResume", #selector(didReceiveOnResume))
        NotificationUtils.register(self, "onFCMReceive", #selector(onFCMReceive))
        NotificationUtils.register(self, MessageSyncService.ACTION_ON_SYNC_MESSAGE_PROCESSING, #selector(messageSyncProcessing(_:)))
        NotificationUtils.register(self, MessageSyncService.ACTION_ON_SYNC_MESSAGE_COMPLETED, #selector(messageSyncCompleted(_:)))
        NotificationUtils.register(self, NotificationSyncService.ACTION_ON_SYNC_NOTIFICATION_COMPLETED, #selector(notificationSyncCompleted(_:)))
        NotificationUtils.register(self, NotificationSyncService.ACTION_ON_SYNC_PRODUCT_ALARM_COMPLETED, #selector(productAlarmSyncCompleted(_:)))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationUtils.remove(self, "onResume")
        NotificationUtils.remove(self, "onFCMReceive")
        NotificationUtils.remove(self, MessageSyncService.ACTION_ON_SYNC_MESSAGE_PROCESSING)
        NotificationUtils.remove(self, MessageSyncService.ACTION_ON_SYNC_MESSAGE_COMPLETED)
        NotificationUtils.remove(self, NotificationSyncService.ACTION_ON_SYNC_NOTIFICATION_COMPLETED)
        NotificationUtils.remove(self, NotificationSyncService.ACTION_ON_SYNC_PRODUCT_ALARM_COMPLETED)
    }
    
    
    @objc private func onFCMReceive(_ notification : Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        let handler = userInfo["notificationHandler"] as? (_ options:   UNNotificationPresentationOptions) -> Void
        self.onMessageReceived(userInfo, handler: handler)
    }
    
    @objc private func didReceiveOnResume(_ notification: Notification) {
        if let vc = UIApplication.topViewController() as? UIViewStepController, vc == self {
            onResume()
        }
    }
    
    @objc private func messageSyncProcessing(_ notification: Notification) {
        self.onMessageSyncProcessing()
    }
    
    @objc private func messageSyncCompleted(_ notification: Notification) {
        self.onMessageSyncCompleted()
    }
    @objc private func notificationSyncCompleted(_ notification: Notification) {
        self.onNotificationSyncCompleted()
    }
    
    @objc private func productAlarmSyncCompleted(_ notification: Notification) {
        self.onProductAlarmSyncCompleted()
    }
    
    public func onMessageReceived(_ userInfo : [AnyHashable : Any], handler: ((_ options:   UNNotificationPresentationOptions) -> Void)? = nil) {
        LogEx.e("onMessageReceived")
        if let handler = handler {
            handler([.banner, .list, .badge, .sound])
        }
    }
    
    public func onMessageSyncProcessing() {
    }
    
    public func onMessageSyncCompleted() {
    }
    
    public func onNotificationSyncCompleted() {
    }
    
    public func onProductAlarmSyncCompleted() {
    }
    
    public func onResume() {
    }
    
    @objc func scrollViewTouchBegan(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    var indicatorBackground : UIView? = nil
    
    func showIndicator() {
        if Thread.current.isMainThread == false {
            DispatchQueue.main.async {
                self.showIndicator()
            }
        }
        if indicatorBackground == nil {
            indicatorBackground = UIView.init(frame: CGRect.init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
            indicatorBackground!.backgroundColor = Colors._00000000.color
            indicatorBackground!.isUserInteractionEnabled = true
        }
        activityIndicatorView.startAnimating()
        activityIndicatorView.center = CGPoint(x: indicatorBackground!.bounds.midX, y: indicatorBackground!.bounds.midY)
        indicatorBackground!.addSubview(activityIndicatorView)
        view.addSubview(indicatorBackground!)
    }
    
    func hideIndicator() {
        if Thread.current.isMainThread == false {
            DispatchQueue.main.async {
                self.hideIndicator()
            }
        }
        guard let background = indicatorBackground else {
            return
        }
        if background.superview != self.view {
            return
        }
        activityIndicatorView.stopAnimating()
        activityIndicatorView.removeFromSuperview()
        background.removeFromSuperview()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func showErrorMessage(_ ifv : InputFormView?, _ message : String) {
        guard let ifvv = ifv else {
            return
        }
        ifvv.isError = true
        ifvv.errorMsg = message
        ifvv.becomeFirstResponder()
    }
    var progressDialog : ProgressDialog? = nil
    
    public func showProgressDialog(_ message : String) {
        self.progressDialog = ProgressDialog.instantiate(self.view) as? ProgressDialog
        self.progressDialog?.configureWithData(message)
        guard let dialog = self.progressDialog else {
            return
        }
        dialog.show()
    }
    
    public func setProgressMessage(_ message : String) {
        guard let dialog = progressDialog else {
            return
        }
        dialog.configureWithData(message)
    }
    
    public func dismissProgressDialog() {
        guard let dialog = progressDialog else {
            return
        }
        dialog.removeFromSuperview()
    }*/
}

extension UIScrollView {
    
    // Scroll to a specific view so that it's top is at the top our scrollview
    func scrollToView(view:UIView) {
        if let origin = view.superview {
            // Get the Y position of your child view
            let childStartPoint = origin.convert(view.frame.origin, to: self)
            let bottomOffset = scrollBottomOffset()
            if (childStartPoint.y > bottomOffset.y) {
                setContentOffset(bottomOffset, animated: true)
            } else {
                setContentOffset(CGPoint(x: 0, y: childStartPoint.y), animated: true)
            }
        }
    }
    
    // Bonus: Scroll to top
    func scrollToTop() {
        let topOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(topOffset, animated: true)
    }
    
    // Bonus: Scroll to bottom
    func scrollToBottom() {
        let bottomOffset = scrollBottomOffset()
        if(bottomOffset.y > 0) {
            setContentOffset(bottomOffset, animated: true)
        }
    }
    
    private func scrollBottomOffset() -> CGPoint {
        return CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
    }
    
}


