//
//  CWButton.swift
//  CardWorkout-Programmatic
//
//  Created by Іван Штурхаль on 11.09.2023.
//

import UIKit

class CWButton: UIButton {

    // переписуємо ініт за замовчуванням
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    // зʼявляється автоматично
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // create your own init
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        configure()
    }
    
    // налаштування кнопки
    func configure() {
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false // means is use AutoLayout
    }

}
