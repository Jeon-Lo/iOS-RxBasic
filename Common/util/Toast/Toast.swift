import UIKit

public struct Delay {
  public static let short: TimeInterval = 2.0
  public static let long: TimeInterval = 3.5
}

open class Toast: Operation {

  // MARK: Properties

  public var text: String? {
    get { return self.view.text }
    set { self.view.text = newValue }
  }

  public var delay: TimeInterval
  public var duration: TimeInterval

  private var _executing = false
  override open var isExecuting: Bool {
    get {
      return self._executing
    }
    set {
      self.willChangeValue(forKey: "isExecuting")
      self._executing = newValue
      self.didChangeValue(forKey: "isExecuting")
    }
  }

  private var _finished = false
  override open var isFinished: Bool {
    get {
      return self._finished
    }
    set {
      self.willChangeValue(forKey: "isFinished")
      self._finished = newValue
      self.didChangeValue(forKey: "isFinished")
    }
  }


  // MARK: UI

  public var view: ToastView = ToastView()


  // MARK: Initializing

  public init(text: String?, delay: TimeInterval = 0, duration: TimeInterval = Delay.short) {
    self.delay = delay
    self.duration = duration
    
    super.init()
    self.view.textColor = Colors.ffffff.color
    self.view.font = UIFont.systemFont(ofSize: 14)
    self.text = text
  }


  // MARK: Factory (Deprecated)

  @available(*, deprecated, message: "Use 'init(text:)' instead.")
  public class func makeText(_ text: String) -> Toast {
    return Toast(text: text)
  }

  @available(*, deprecated, message: "Use 'init(text:duration:)' instead.")
  public class func makeText(_ text: String, duration: TimeInterval) -> Toast {
    return Toast(text: text, duration: duration)
  }

  @available(*, deprecated, message: "Use 'init(text:delay:duration:)' instead.")
  public class func makeText(_ text: String?, delay: TimeInterval, duration: TimeInterval) -> Toast {
    return Toast(text: text, delay: delay, duration: duration)
  }


  // MARK: Showing

  public func show() {
    ToastCenter.default.add(self)
  }


  // MARK: Cancelling

  open override func cancel() {
    super.cancel()
    self.finish()
    self.view.removeFromSuperview()
  }


  // MARK: Operation Subclassing

  override open func start() {
    let isRunnable = !self.isFinished && !self.isCancelled && !self.isExecuting
    guard isRunnable else { return }
    guard Thread.isMainThread else {
      DispatchQueue.main.async { [weak self] in
        self?.start()
      }
      return
    }
    main()
  }

  override open func main() {
    self.isExecuting = true

    DispatchQueue.main.async {
      self.view.setNeedsLayout()
      self.view.alpha = 0
      ToastWindow.shared.addSubview(self.view)

      UIView.animate(
        withDuration: 0.5,
        delay: self.delay,
        options: .beginFromCurrentState,
        animations: {
          self.view.alpha = 1
        },
        completion: { completed in
          UIView.animate(
            withDuration: self.duration,
            animations: {
              self.view.alpha = 1.0001
            },
            completion: { completed in
              self.finish()
              UIView.animate(
                withDuration: 0.5,
                animations: {
                  self.view.alpha = 0
                },
                completion: { completed in
                  self.view.removeFromSuperview()
                }
              )
            }
          )
        }
      )
    }
  }

  func finish() {
    self.isExecuting = false
    self.isFinished = true
  }

}
