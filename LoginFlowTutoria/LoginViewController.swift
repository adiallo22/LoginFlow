//
//  LoginViewController.swift
//  LoginFlowTutoria
//
//  Created by Abdul Diallo on 5/12/21.
//

import UIKit
import SnapKit


class LoginViewController: UIViewController {
    private let loginViewModel: LoginViewModel
        
    private var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Tutorial"
        view.font = UIFont.systemFont(ofSize: 50)
        view.textColor = .init(white: 0.8, alpha: 0.8)
        return view
    }()
    
    private var emailTextField = UITextField.makeAuthenticationTextfield("Email")
    
    private var passwordTextField = UITextField.makeAuthenticationTextfield("Password")
    
    private var loginButton = UIButton.makeAuthenticationButton(
        withTitle: "Login",
        backgroundColor: .lightGray
    )
    
    private var singupButton = UIButton.makeAuthenticationButton(
        withTitle: "Sign Up",
        backgroundColor: .systemBlue
    )
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailTextField,
                                                   passwordTextField,
                                                   loginButton,
                                                   singupButton])
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationController?.navigationBar.isHidden = true
        
        configureUI()
        
        singupButton.addTarget(self, action: #selector(singupButtonPressed), for: .touchUpInside)
        
    }
    
    fileprivate func configureUI() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(stack)
        stack.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.left.right.equalToSuperview().inset(30)
        }
    }
    
    @objc private func singupButtonPressed() {
        loginViewModel.signup()
    }
    
}
