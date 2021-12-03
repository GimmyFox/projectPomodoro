//
//  ViewController.swift
//  projectPomodoro
//
//  Created by Maksim Guzeev on 03.12.2021.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK: - setup objects -
        
        let timerLabel: UILabel = { // лейбл, который отвечает за вывод таймера
            let label = UILabel()
            label.text = "00:10"
            label.font = .boldSystemFont(ofSize: 50)
            label.textColor = .black
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            
                    
            return label
        }()

        let switchLabel: UILabel = { // лейбл для вывода фразы
            let label = UILabel()
            label.text = "let's do some work!"
            label.font = .boldSystemFont(ofSize: 30)
            label.textColor = .black
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        let timerButton: UIButton = { // кнопка старта таймера
            let button = UIButton()
            button.layer.cornerRadius = 20
            button.backgroundColor = .darkGray
            button.setTitle("Start", for: .normal)
            button.addTarget(self, action: #selector(timerButtonAction), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    
    //MARK: - constraints -
    
    func setupLayout() {
        
        view.addSubview(timerButton)
        NSLayoutConstraint.activate([
            timerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            timerButton.heightAnchor.constraint(equalToConstant: 70),
            timerButton.widthAnchor.constraint(equalToConstant: 130)
        ])
        
        view.addSubview(timerLabel)
        NSLayoutConstraint.activate([
            timerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            timerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            timerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),
            ])
        
        view.addSubview(switchLabel)
        NSLayoutConstraint.activate([
            switchLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            switchLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -620),
            switchLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            switchLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            ])
}

}

