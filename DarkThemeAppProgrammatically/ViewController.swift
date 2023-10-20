//
//  ViewController.swift
//  DarkThemeAppProgrammatically
//
//  Created by Артур Олехно on 18/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var isDark = false
    var mainText = "Dark Theme on"
    
    private let changeThemeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Dark Theme on", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        view.backgroundColor = .systemBackground
        view.addSubview(changeThemeButton)
        applyConstrains()
        changeThemeButton.addTarget(self, action: #selector(changeThemeTapped), for: .touchUpInside)
    }
    
    private func configureNavBar() {
        title = "Dark Theme App"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: #selector(basicAlert))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(actionSheetAlert))
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
    }
    
    @objc func changeThemeTapped() {
//        if isDark {
//            view.backgroundColor = UIColor.white
//            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//            changeThemeButton.setTitle("Dark Theme on", for: .normal)
//            changeThemeButton.setTitleColor(UIColor.white, for: .normal)
//            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
//            isDark = false
//        } else {
//            view.backgroundColor = UIColor.black
//            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//            changeThemeButton.setTitle("Dark Theme off", for: .normal)
//            changeThemeButton.setTitleColor(UIColor.black, for: .normal)
//            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
//            isDark = true
//        }
        darkThemeIsOn(isOn: isDark)
    }
    
    func darkThemeIsOn(isOn: Bool) {
        mainText = !isOn ? "Dark Theme off" : "Dark Theme on"
        changeThemeButton.setTitle(mainText, for: .normal)
        view.backgroundColor = isOn ? .white : .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
        changeThemeButton.setTitleColor(isOn ? .white : .black, for: .normal)
        isDark.toggle()
    }
    
    private func applyConstrains() {
        let changeThemeButtonConstrains = [
            changeThemeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeThemeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            changeThemeButton.widthAnchor.constraint(equalToConstant: 180),
            changeThemeButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(changeThemeButtonConstrains)
    }
}

extension UIViewController {
    
    @objc func basicAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Message", message: "Some alert", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    @objc func actionSheetAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Some text", message: "You information", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}
