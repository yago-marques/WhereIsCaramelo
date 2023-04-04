//
//  VerifyFirstAccess.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 30/03/23.
//

import Foundation

protocol VerifyFirstUserAccess {
    func isFirstAccess() async throws -> Bool
}
