//
//  String+Length.swift
//  brazilianfriends
//
//  Created by Claudio on 13/12/15.
//  Copyright © 2015 iDeiasMob. All rights reserved.
//

import Foundation

extension String {
    /**
     Return the nunber of character on a String  (Deprecated at Swift 4)
     
     - Returns: An Int with number of character
     
     - Version: 1.0
    */
    var length: Int {
        return count
    }

    /**
     Verifica se uma determinada string contem uma string dada
     
     - Parameter find: string fornecida
     
     - Returns: True se a string contem a string fornecida, False caso não contenha
     
     - Version: 1.0
     
     */
   func contains(_ find: String) -> Bool {
        return self.range(of: find) != nil
    }
    
    
    /**
     Retorna a posição de um caracter fornecido, sendo zero a primeira posição
     - Important: O retorno considera posição inicial como zero, não pode ser utilizada no caso de pesquisa de uma string ao invés de um caracter
     
     - Parameter char: caracter fornecido diferente de vazio e não podendo ser uma string
     
     - Returns:
        - Um Int com a posição do caracter encontrado iniciando em zero
        - Nil caso o caracter não seja encontrado.
     
     - Version: 1.0
     
     */
    func indexOfCharacter(_ char: Character) -> Int? {
        if let idx = self.index(of: char) {
            return self.distance(from: self.startIndex, to: idx)
        }
        return nil
    }

    /**
     Retorna uma substring extraida da string original dada a posição inicial e final, inclusive.
     
     - Important:
        - Na função original, não estava sendo incluido o ultimo caracter, exemplo: "maria".substringWithRange(start: 1, end: 3) estava retornando "ar" quando o correto seria "ari"
        - Em caso de números negativos ou do start ser maior que o end, uma string em branco é retornada
     
     - Parameters:
        - start: Int positivo representando a posição de inicio da string a ser extraida sendo, considerando zero a primeira posição.
        - end: Int positivo, representando a posição final da string a ser extraída, no caso de o número dado ser maior que o tamanho da string, ele considera o tamanho da string
     
     
     - Returns: Uma substring da string original
     
     - Version: 1.0
     
     */
    func substringWithRange(_ start: Int, end: Int) -> String
    {
        var endAux = end + 1
        if (start < 0 || start > self.count)
        {
            print("start index \(start) out of bounds")
            return ""
        }
        else if endAux < 0 || endAux > self.count
        {
            endAux = self.count
        }else if start > endAux
        {    
            print("start index \(start) big then end")
            return ""
        }
        
        let range = Range(self.index(self.startIndex, offsetBy: start)..<self.index(self.startIndex, offsetBy: endAux))
        return String(self[range])
    }
    
    /**
     Retorna uma substring extraida da string original dada a posição inicial e o comprimento em caracteres.
     
     - Parameters:
     - start: Int positivo representando a posição de inicio da string a ser extraida sendo, considerando zero a primeira posição.
     - location: Int positivo, representando a quantidade de caracteres  da string a ser extraída, no caso de o número dado ser maior que o tamanho da string, ele considera o tamanho da string
     
     - Returns: Uma substring da string original
     
     - Version: 1.0
     
     */
    func substringWithRange(_ start: Int, location: Int) -> String
    {
        var locationAux = location
        if (start < 0 || start > self.count)
        {
            print("start index \(start) out of bounds")
            return ""
        }
        else if location < 0
        {
            print("end index \(start + location) out of bounds")
            return ""
        }
        else if start + location > self.count
        {
            locationAux = self.count - start
        }
        let range = Range(self.index(self.startIndex, offsetBy: start)..<self.index(self.startIndex, offsetBy: start + locationAux))
        return String(self[range])
    }
    
    
    var fromBase64 : String
    {
        let data = Data(base64Encoded: self, options: NSData.Base64DecodingOptions(rawValue: 0))
        return String(data: data!, encoding: String.Encoding.utf8)!
    }
    
    var toBase64 : String
    {
        let data = self.data(using: String.Encoding.utf8)
        return data!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
    }

    var isValidEmail : Bool {
        if self.length == 0 {
            return false
        }else{
            let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: self)
        }
    }
    
    var stripeHTML : String
    {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
    }
    
    var dateFromRSSFormat: Date {
        let formato = DateFormatter()
        formato.dateFormat = "EEE, dd MMMM yyyy HH:mm:ss Z"
        formato.timeZone = NSTimeZone.system
        formato.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        formato.formatterBehavior = .default
        return formato.date(from: self)!
    }
    
    var capitalizingFirstLetter : String {
        let first = String(prefix(1)).capitalized
        let other = String(dropFirst())
        return first+other
    }
    
    func stringToDate(format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  format
        let dateObj = dateFormatter.date(from: self)
        return dateObj!
    }
    
    func dateFromBrDateFormat() -> Date? {
        let formato = DateFormatter()
        formato.dateFormat = "dd/MM/yy"
        if self.length > 8 {
            formato.dateFormat = "dd/MM/yyyy"
        }
        formato.timeZone = NSTimeZone.system
        formato.locale = NSLocale.current
        formato.formatterBehavior = .default
        return formato.date(from: self)
    }
}
