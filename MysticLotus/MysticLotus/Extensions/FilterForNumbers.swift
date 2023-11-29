//
//  FilterForNumbers.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 29/11/23.
//

import Foundation

extension String {
    func filtrarNumeros() -> String {
        let caracteresNumericos = self.filter { "0"..."9" ~= $0 }
        return String(caracteresNumericos)
    }
}
