//
//  UItextField+Extension.swift
//  LoginFlowTutoria
//
//  Created by Abdul Diallo on 5/12/21.
//

import UIKit

extension UITextField {
    
    static func makeAuthenticationTextfield(_ placeholder: String) -> UITextField {
        let view = UITextField()
        view.textColor = .white
        view.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
            .foregroundColor: UIColor.lightGray
        ])
        view.borderStyle = .none
        return view
    }
    
}
