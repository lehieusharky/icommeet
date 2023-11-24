//
//  AppRoute.swift
//  ImomeetVision
//
//  Created by Thien Vu on 05/10/2023.
//

import Foundation

enum Route {
    case login
    case main
}

class AppRouter: ObservableObject {
    
    @Published var routes: [Route] = [.login]
    
    var currentRoute: Route? {
        return routes.last
    }
    
    func push(_ route: Route) {
        routes.append(route)
    }
    
    @discardableResult
    func pop() -> Route? {
        routes.popLast()
    }
}
