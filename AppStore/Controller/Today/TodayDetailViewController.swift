//
//  TodayDetailViewController.swift
//  AppStore
//
//  Created by Manoel Filho on 06/02/21.
//

import UIKit

class TodayDetailViewController: UIViewController {
    
    let closeButton: UIButton = .getCloseButton()
    
    var centerView: UIView?
    var frame: CGRect?
    
    var topConstraints: NSLayoutConstraint?
    var leadingConstraints: NSLayoutConstraint?
    var widthConstraints: NSLayoutConstraint?
    var heigthConstraints: NSLayoutConstraint?
    
    var handleClose: (() -> ())?
    
    let todaViewUniqueController = TodaViewUniqueController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    }
    
    func addUnique(){
        self.centerView = todaViewUniqueController.view
        self.animation()
    }
    
    func addButtonClose(){
        view.addSubview(closeButton)
        closeButton.alpha = 0
        closeButton.addTarget(self, action: #selector(handleCloseClick), for: .touchUpInside)
        closeButton.preencher(
            top: self.view.safeAreaLayoutGuide.topAnchor,
            leading: nil,
            bottom: nil,
            trailing: view.trailingAnchor,
            padding: .init(top: 18, left: 0, bottom: 0, right: 24),
            size: .init(width: 32, height: 32)
        )
        UIView.animate(withDuration: 0.3, delay: 0.2, options: .showHideTransitionViews, animations: {
            self.closeButton.alpha = 1
        }, completion: nil)
    }
    
    func animationClose(){
        UIView.animate(
            withDuration: 0.3,
            delay: 0.0,
            options: .overrideInheritedCurve,
            animations: {
                if let frame = self.frame {
                    self.topConstraints?.constant = frame.origin.y
                    self.leadingConstraints?.constant = frame.origin.x
                    self.widthConstraints?.constant = frame.width
                    self.heigthConstraints?.constant = frame.height
                    self.centerView?.layer.cornerRadius = 16
                    self.view.layoutIfNeeded()
                }
            }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @objc func handleCloseClick() {
        self.closeButton.isHidden = true
        self.handleClose?()
        self.animationClose()
    }
    
    func animation(){
        
        guard let centerView = self.centerView else { return }
        guard let frame = self.frame else { return }
        
        centerView.translatesAutoresizingMaskIntoConstraints = false
        
        centerView.layer.cornerRadius = 16
        centerView.clipsToBounds = true
        
        view.addSubview(centerView)
        self.addButtonClose()
        
        self.topConstraints = centerView.topAnchor.constraint(equalTo: view.topAnchor, constant: frame.origin.y)
        self.leadingConstraints = centerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: frame.origin.x)
        self.widthConstraints = centerView.widthAnchor.constraint(equalToConstant: frame.width)
        self.heigthConstraints = centerView.heightAnchor.constraint(equalToConstant: frame.height)
        
        self.topConstraints?.isActive = true
        self.leadingConstraints?.isActive = true
        self.widthConstraints?.isActive = true
        self.heigthConstraints?.isActive = true
        
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .overrideInheritedCurve, animations: {
            
            self.topConstraints?.constant = 0
            self.leadingConstraints?.constant = 0
            self.widthConstraints?.constant = self.view.frame.width
            self.heigthConstraints?.constant = self.view.frame.height
            
            self.centerView?.layer.cornerRadius = 0
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
    }
    
}
