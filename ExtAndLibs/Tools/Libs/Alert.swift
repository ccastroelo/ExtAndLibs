//
//  Alert.swift
//  Diarias
//
//  Created by Claudio on 12/04/2018.
//  Copyright © 2018 MPT. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    
    static func create(titulo: String, mensagem: String, opcoes: [(opt: String, handler: (() -> Void)?)] )  -> UIAlertController {
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: UIAlertControllerStyle.alert)
        for opcao in opcoes {
            let botao = UIAlertAction(title: opcao.opt, style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
                if opcao.handler != nil {
                    opcao.handler!()
                }
            }
            alert.addAction(botao)
        }
        return alert
    }
    
    static func createOk(titulo: String, mensagem: String, closeHandler: (() -> Void)? ) -> UIAlertController {
        let alert = self.create(titulo: titulo, mensagem: mensagem, opcoes: [(opt: "OK", handler: closeHandler)])
        return alert
    }
    
    static func createSN(titulo: String, mensagem: String, closeHandlerSim: (() -> Void)?, closeHandlerNao: (() -> Void)? ) -> UIAlertController {
        let alert = self.create(titulo: titulo, mensagem: mensagem, opcoes: [(opt: "Sim", handler: closeHandlerSim), (opt: "Não", handler: closeHandlerNao)])
        return alert
    }
}
