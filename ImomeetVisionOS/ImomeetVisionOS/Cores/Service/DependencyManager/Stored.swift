//
//  Stored.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 13/11/2023.
//
import Foundation

public typealias DependencyFactory = () -> AnyObject?

public protocol StoreInterface {
    func get<T>(_ arg: T.Type) -> T?
    func register<T>(_ metaType: T.Type, _ factory: @escaping DependencyFactory)
}

final class Store: StoreInterface {

    var dependencies = NSMapTable<NSString, AnyObject>(
        keyOptions: .strongMemory,
        valueOptions: .weakMemory
    )

    var dependencyCreators = [String: DependencyFactory]()

    func get<T>(_ arg: T.Type) -> T? {
        let name = String(describing: arg)
        let object = dependencies.object(forKey: name as NSString)
        if object == nil {
            guard let factory: DependencyFactory = dependencyCreators[name] else {
                return nil
            }
            if let newInstance: AnyObject = factory() {
                dependencies.setObject(newInstance, forKey: name as NSString)
                return newInstance as? T
            }
            return nil
        } else {
            return object as? T
        }
    }

    func register<T>(_ metaType: T.Type, _ factory: @escaping DependencyFactory) {
        let name = String(describing: metaType)
        dependencyCreators[name] = factory
    }
}
