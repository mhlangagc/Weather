//
//  Observable.swift
//  Weather
//
//  Created by Gugulethu Mhlanga on 2023/06/05.
//

import Foundation

final class Observable<T> {
    private var observers = [String: ((T) -> Void)]()
    
    var value: T? {
        didSet {
            self.notify()
        }
    }
    
    init(_ value: T? = nil) {
        self.value = value
    }
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping ((T) -> Void)) {
        observers[observer.description] = completionHandler
    }
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping ((T) -> Void)) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    private func notify() {
        guard let value = value else { return }
        observers.forEach({ $0.value(value) })
    }
    
    deinit {
        observers.removeAll()
    }
}
