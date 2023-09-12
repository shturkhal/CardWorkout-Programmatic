//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Іван Штурхаль on 11.09.2023.
//

import UIKit

class CardSelectionVC: UIViewController {
    //MARK: create new custom elements
    let cardImageView = UIImageView()
    let stopButton = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let resetButton = CWButton(backgroundColor: .systemGreen, title: "Reset")
    let rulesButton = CWButton(backgroundColor: .systemBlue, title: "Rules")
    var timer: Timer!
    var cards: [UIImage] = Card.allValues
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        startTimer()
        configureUI()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func configureUI() {
        configureCardImageView()
    }
  
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "ace_of_spades")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
                                ])
    }

    func configureStopButton() {
        view.addSubview(stopButton)
        stopButton.setImage(UIImage(systemName: "stop.circle"), for: .normal)
        
        
        stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
                                    ])
    }
    func configureResetButton() {
        view.addSubview(resetButton)
        resetButton.setImage(UIImage(systemName: "autostartstop.trianglebadge.exclamationmark"), for: .normal)
        
        resetButton.addTarget(self, action: #selector(restartAll), for: .touchUpInside)
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
                                    ])
    }
    func configureRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.setImage(UIImage(systemName: "text.book.closed"), for: .normal)
        
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
                                    ])
    }
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
    }
    @objc func restartAll() {
        timer.invalidate()
        startTimer()
    }
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "ace_of_spades")
    }
    @objc func stopButtonTapped() {
        timer.invalidate()
    }
}
