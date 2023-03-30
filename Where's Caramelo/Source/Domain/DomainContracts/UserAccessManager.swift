//
//  UserAccessManager.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 30/03/23.
//

import Foundation

protocol UserAccessManager {
    func isFirstAccess() async throws -> Bool
    func registerFirstAccess() async throws
}
