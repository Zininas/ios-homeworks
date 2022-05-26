//
//  Protocols.swift
//  Navigation
//
//  Created by Александр Зинин on 20.05.2022.
//

import Foundation

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}

protocol ProfileHeaderViewProtocol: AnyObject {
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void)
}
protocol TapLikedDelegate {
    func updateLike(indexRow: Int)
}

protocol TapImagePostDelegate {
    func enlargePost(indexRow: Int)
}

protocol TapLikedPostDelegate {
    func updateLikePost()
}
