import Foundation
import UIKit

precedencegroup ConstraintPrecedence {
    associativity: left
    lowerThan: AdditionPrecedence
    higherThan: AssignmentPrecedence
}

infix operator ->> : ConstraintPrecedence

@discardableResult
public func ->> <T> (lhs: NSLayoutAnchor<T>, rhs: NSLayoutAnchor<T>) -> NSLayoutConstraint {
    let constraint = lhs.constraint(equalTo: rhs)
    constraint.isActive = true
    return constraint
}

public extension UIView {
    
    func constrain(to view: UIView,
                   leftOffset: CGFloat = 0,
                   rightOffset: CGFloat = 0,
                   topOffset: CGFloat = 0,
                   bottomOffset: CGFloat = 0,
                   height: CGFloat = 0,
                   width: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: leftOffset).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: rightOffset).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: topOffset).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomOffset).isActive = true
    }

    func constrain(to view: UIView) {
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @discardableResult
    func width(_ width: CGFloat) -> Self {
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    @discardableResult
    func height(_ height: CGFloat) -> Self {
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    func pad(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) {
        self.layoutMargins = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    func setBorderWidth(width: CGFloat, color: UIColor?, cornerRadius: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color?.cgColor
        self.layer.cornerRadius = cornerRadius
    }
    
    func tap(_ target: Any?, _ action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

}
