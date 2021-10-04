import UIKit
import Toaster
import Photos

final class RootViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let button = UIButton(type: .system)
    button.setTitle("Show", for: .normal)
    button.sizeToFit()
    button.addTarget(self, action: #selector(self.showButtonTouchUpInside), for: .touchUpInside)
    button.autoresizingMask = [.flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin]
    button.center = CGPoint(x: view.center.x, y: 75)
    self.view.addSubview(button)
    
    let navigateButton = UIButton(type: .system)
    navigateButton.setTitle("Next ViewController", for: .normal)
    navigateButton.sizeToFit()
    navigateButton.addTarget(self, action: #selector(self.navigate), for: .touchUpInside)
    navigateButton.autoresizingMask = [.flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin]
    navigateButton.center = CGPoint(x: view.center.x, y: 125)
    self.view.addSubview(navigateButton)
    
    self.configureAppearance()
    self.configureAccessibility()
  }
  
  @objc func navigate() {
    let nextController = NextViewController()
    self.navigationController?.pushViewController(nextController, animated: true)
  }

  func configureAppearance() {
    let appearance = ToastView.appearance()
    appearance.backgroundColor = .lightGray
    appearance.textColor = .black
    appearance.font = .boldSystemFont(ofSize: 16)
    appearance.textInsets = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
    appearance.bottomOffsetPortrait = 100
    appearance.cornerRadius = 20
    appearance.maxWidthRatio = 0.7
  }

  func configureAccessibility() {
    ToastCenter.default.isSupportAccessibility = true
  }

  @objc dynamic func showButtonTouchUpInside() {
    Toast(text: "Basic Toast").show()
  }
}


class NextViewController: UIViewController {
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    AppUtility.lockOrientation(.landscapeRight, andRotateTo: UIInterfaceOrientation.landscapeRight)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    AppUtility.lockOrientation(.all)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let button = UIButton(type: .system)
    button.setTitle("Show", for: .normal)
    button.sizeToFit()
    button.addTarget(self, action: #selector(self.showButtonTouchUpInside), for: .touchUpInside)
    button.autoresizingMask = [.flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin]
    button.center = CGPoint(x: view.center.x, y: 75)
    self.view.addSubview(button)
  }
    
  @objc dynamic func showButtonTouchUpInside() {
      Toast(text: "Basic Toast").show()
    }
    
}
