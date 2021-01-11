/
//  LogInUser.swift
//  Woop_Digital
//
//  Created by User on 26/7/20.
//  Copyright © 2020 Woop. All rights reserved.
//


import Foundation
import UIKit


    static var loginUserLabel = UILabel()
    static var username: String = ""


	static func loginUserLabelMethod() {
        loginUserLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        loginUserLabel.lineBreakMode = .byWordWrapping
        loginUserLabel.numberOfLines = 0
        loginUserLabel.contentMode = .scaleToFill
        let white = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        loginUserLabel.textColor = UIColor(cgColor: white)
       
        loginUserLabel.layer.shadowColor = UIColor.black.cgColor
        loginUserLabel.layer.shadowRadius = 2.4
        loginUserLabel.layer.shadowOpacity = 0.8
        loginUserLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        loginUserLabel.layer.masksToBounds = false
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "account")
        attachment.bounds = CGRect(x: -20, y: -2, width: 15, height: 15)
        let attributedString = NSMutableAttributedString(string: "")
        attributedString.append(NSAttributedString(attachment: attachment))
        let textAfterIcon = NSMutableAttributedString(string: "  \(username)")
        attributedString.append(textAfterIcon)
        loginUserLabel.textAlignment = .center
        loginUserLabel.attributedText = attributedString
        loginUserLabel.borderDash(withRadius: 4, borderWidth: 0.4, borderColor: .white, dashSize: 2)

    }
    
    
    
    
    extension UIView {
    func borderDash(withRadius cornerRadius: Float, borderWidth: Float, borderColor: UIColor, dashSize: Int) {
        let currentFrame = self.bounds
        let shapeLayer = CAShapeLayer()
        let path = CGMutablePath()
        let radius = CGFloat(cornerRadius)

        // Points - Eight points that define the round border. Each border is defined by two points.
        let topLeftPoint = CGPoint(x: radius, y: 0)
        let topRightPoint = CGPoint(x: currentFrame.size.width - radius, y: 0)
        //let middleRightTopPoint = CGPoint(x: currentFrame.size.width, y: radius)
        let middleRightBottomPoint = CGPoint(x: currentFrame.size.width, y: currentFrame.size.height - radius)
        //let bottomRightPoint = CGPoint(x: currentFrame.size.width - radius, y: currentFrame.size.height)
        let bottomLeftPoint = CGPoint(x: radius, y: currentFrame.size.height)
        //let middleLeftBottomPoint = CGPoint(x: 0, y: currentFrame.size.height - radius)
        let middleLeftTopPoint = CGPoint(x: 0, y: radius)

        // Points - Four points that are the center of the corners borders.
        let cornerTopRightCenter = CGPoint(x: currentFrame.size.width - radius, y: radius)
        let cornerBottomRightCenter = CGPoint(x: currentFrame.size.width - radius, y: currentFrame.size.height - radius)
        let cornerBottomLeftCenter = CGPoint(x: radius, y: currentFrame.size.height - radius)
        let cornerTopLeftCenter = CGPoint(x: radius, y: radius)

        // Angles - The corner radius angles.
        let topRightStartAngle = CGFloat(Double.pi * 3 / 2)
        let topRightEndAngle = CGFloat(0)
        let bottomRightStartAngle = CGFloat(0)
        let bottmRightEndAngle = CGFloat(Double.pi / 2)
        let bottomLeftStartAngle = CGFloat(Double.pi / 2)
        let bottomLeftEndAngle = CGFloat(Double.pi)
        let topLeftStartAngle = CGFloat(Double.pi)
        let topLeftEndAngle = CGFloat(Double.pi * 3 / 2)

        // Drawing a border around a view.
        path.move(to: topLeftPoint)
        path.addLine(to: topRightPoint)
        path.addArc(center: cornerTopRightCenter,
                    radius: radius,
                    startAngle: topRightStartAngle,
                    endAngle: topRightEndAngle,
                    clockwise: false)
        path.addLine(to: middleRightBottomPoint)
        path.addArc(center: cornerBottomRightCenter,
                    radius: radius,
                    startAngle: bottomRightStartAngle,
                    endAngle: bottmRightEndAngle,
                    clockwise: false)
        path.addLine(to: bottomLeftPoint)
        path.addArc(center: cornerBottomLeftCenter,
                    radius: radius,
                    startAngle: bottomLeftStartAngle,
                    endAngle: bottomLeftEndAngle,
                    clockwise: false)
        path.addLine(to: middleLeftTopPoint)
        path.addArc(center: cornerTopLeftCenter,
                    radius: radius,
                    startAngle: topLeftStartAngle,
                    endAngle: topLeftEndAngle,
                    clockwise: false)

        // Path is set as the shapeLayer object's path.
        shapeLayer.path = path;
        shapeLayer.backgroundColor = UIColor.clear.cgColor
        shapeLayer.frame = currentFrame
        shapeLayer.masksToBounds = false
        shapeLayer.setValue(0, forKey: "isCircle")
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = borderColor.cgColor
        shapeLayer.lineWidth = CGFloat(borderWidth)
        shapeLayer.lineDashPattern = [NSNumber(value: dashSize), NSNumber(value: dashSize)]
        shapeLayer.lineCap = CAShapeLayerLineCap.round

        self.layer.addSublayer(shapeLayer)
        self.layer.cornerRadius = radius;
    }
}