import UIKit

extension UIButton {
    
    static func makeAuthenticationButton(
        withTitle title: String,
        backgroundColor: UIColor
    ) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        button.snp.makeConstraints {
            $0.height.equalTo(35)
        }
        
        return button
    }
}
