//
//  Gradient.swift
//  stackOFlowApp
//
//  Created by Egor Devyatov on 19/09/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//
import UIKit

// расширение для генерации градиента из разных цветов
extension UIView {
    func applyGradient(colours: [UIColor]) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = CGPoint(x : 0.0, y : 0.0)
        gradient.endPoint = CGPoint(x :0.0, y: 1.0)
        self.layer.insertSublayer(gradient, at: 0)
    }
}
