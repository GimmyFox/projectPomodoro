//
//  ViewController.swift
//  projectPomodoro
//
//  Created by Maksim Guzeev on 03.12.2021.
//

import UIKit

class ViewController: UIViewController {

    private lazy var timer = Timer()
    
    private lazy var timerDuration = 10
    
    private lazy var isWorkMode = false // отвечает за смену РАБОТЫ и ОТДЫХА. Изначально false,тк действий никаких не производилось
    private lazy var isStarted = false // отвечает за СТАРТ и ПАУЗУ. Изначально false,тк действий с кнопкой не производилось
    
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

    // MARK: - setup selector functions -
        
        @objc func timerButtonAction() { // логика кнопки
            
            switch isStarted {
            case true:
                pauseTimer()
            case false:
                startTimer()
                
                
            }
        
        }
        
        @objc func timerAction() { // логика таймера
                timerDuration -= 1
            timerLabel.text = timeFormatted(timerDuration)
            if timerDuration == 0 {
                timer.invalidate()
                workOrRest()
            }
        }
    
    // MARK: - setup main logic -
      
      func workOrRest() { // эта функция отвечает за логику задания
          
          if timerDuration == 0 && isWorkMode { // отвечает за время работы
              
              timerDuration = 10
              timerLabel.text = timeFormatted(timerDuration)
              switchLabel.text = "time to work!"
              isWorkMode = false
              isStarted = false
              timerButton.setTitle("Start", for: .normal)
              
          }
          
          if timerDuration == 0 && !isWorkMode { // отвечает за время отдыха
              
              timerDuration = 5
              timerLabel.text = timeFormatted(timerDuration)
              switchLabel.text = "relax time!"
              timerButton.setTitle("Start", for: .normal)
              isWorkMode = true
              isStarted = false
          }
      }

    
    // MARK: - setup buttons -
    
    func startTimer() {  // логика кнопки старт

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        isStarted = true
        timerButton.setTitle("Pause", for: .normal)
        
    }
    
    func pauseTimer() { // логика кнопки пауза
        timerButton.setTitle("Start", for: .normal)
        timer.invalidate()
        isStarted = false
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String { // формат времени таймера
            let seconds: Int = totalSeconds % 60
            let minutes: Int = (totalSeconds / 60) % 60
            return String(format: "%02d:%02d", minutes, seconds)
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

