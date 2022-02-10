import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var navigation: UINavigationController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        let loginViewModel = LoginViewModel()
        loginViewModel.coordinator = self
        let loginVC = LoginViewController(loginViewModel: loginViewModel)
        navigation = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }

}

extension SceneDelegate: LoginCoordinator {
    func navigateToSignupScreen() {
        let signupViewController = SignupViewController()
        navigation?.pushViewController(signupViewController, animated: true)
    }
}
