import UIKit

final class LoginViewModel {
    weak var coordinator: LoginCoordinator?
    
    func signup() {
        coordinator?.navigateToSignupScreen()
    }
}

protocol LoginCoordinator: AnyObject {
    func navigateToSignupScreen()
}
