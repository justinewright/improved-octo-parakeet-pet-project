//
//  SigninController.swift
//  SoulMessage
//
//  Created by Justine Wright on 2021/07/16.
//

import UIKit
import SwiftUI
import GoogleSignIn

final class SignInController: UIViewController {
    private lazy var authService = GoogleAuth()

    override func viewDidLoad() {
        super.viewDidLoad()
        let signInButton = GIDSignInButton()
        signInButton.colorScheme = GIDSignInButtonColorScheme.dark
        signInButton.addTarget(self, action: #selector(singInButtonPressed), for: .touchUpInside)
        signInButton.center = view.center
        self.view.addSubview(signInButton)
        
    }
    
    @objc func singInButtonPressed(sender: UIButton){
        let _ = authService.signIn()
    }
    
}

struct IntegratedSignInController: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<IntegratedSignInController>) -> SignInController {
        let controller = SignInController()
        return controller
        
    }
    
    
    func updateUIViewController(_ uiViewController: SignInController, context: UIViewControllerRepresentableContext<IntegratedSignInController>) {
        
    }
    
    
}