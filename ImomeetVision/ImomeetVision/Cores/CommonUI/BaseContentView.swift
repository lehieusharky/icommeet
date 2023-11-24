//
//  BaseContentView.swift
//  ImomeetVision
//
//  Created by Thien Vu on 01/10/2023.
//

import Foundation
import SwiftUI

protocol BaseContentView: View {
    var viewModel: BaseViewModel { get }
}
