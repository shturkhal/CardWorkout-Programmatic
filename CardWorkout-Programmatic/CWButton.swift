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
    }
    
    // зʼявляється автоматично
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // create your own init
    init(color: UIColor, title: String, systemImageName: String) {
        super.init(frame: .zero)
       
        configuration = .tinted()
        configuration?.title = title
        configuration?.image = UIImage(systemName: systemImageName)
        configuration?.baseForegroundColor = color
        configuration?.baseBackgroundColor = color
        configuration?.cornerStyle = .medium
        configuration?.imagePadding = 4
        translatesAutoresizingMaskIntoConstraints = false // means is use AutoLayout
    }
}
