//
//  Optional.swift
//  Demo
//
//  Created by shunjie.dsj on 2022/1/27.
//

protocol _OptionalProtocol {
    func isNil() -> Bool
}

extension Optional: _OptionalProtocol {
    func isNil() -> Bool {
        switch self {
        case .none:
            return true
        case .some(_):
            return false
        }
    }
}
