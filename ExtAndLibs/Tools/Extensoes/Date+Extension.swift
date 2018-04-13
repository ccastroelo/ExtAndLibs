//
//  NSDate+Extension.swift
//  Pocket MPT
//
//  Created by Claudio on 16/05/16.
//  Copyright © 2016 Paulo Araújo. All rights reserved.
//

import UIKit

extension Date {
    var formatoMeioDia : Date {
        var calendar = NSCalendar.current
        calendar.timeZone = NSTimeZone.system
        calendar.locale = NSLocale.current
        let unitFlags = Set<Calendar.Component>([.year, .month, .day])
        var dateComps = calendar.dateComponents( unitFlags , from: self as Date)
        let dataFormatada = calendar.date(from: dateComps)
        dateComps.hour = 11
        dateComps.minute = 0
        dateComps.second = 0
        return dataFormatada! as Date
    }
    
    var formataComHora: Date{
        var calendar = NSCalendar.current
        calendar.timeZone = NSTimeZone.system
        calendar.locale = NSLocale.current
        let unitFlags = Set<Calendar.Component>([.year, .month, .day, .hour, .minute])
        let dateComps = calendar.dateComponents( unitFlags , from: self as Date)
        let dataFormatada = calendar.date(from: dateComps)
        return dataFormatada! as Date
    }
    
    var dataFormatada: String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy"
        dateFormat.timeZone = NSTimeZone.system
        let now = self.formataComHora
        return dateFormat.string(from: now as Date)
        
    }
    
    var dataFormatadaPorExtenso: String {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .long
        dateFormat.timeStyle = .none
        dateFormat.timeZone = NSTimeZone.system
        let now = self.formataComHora
        return dateFormat.string(from: now as Date)
        
    }
    
    
    var dataFormatadaComHora: String{
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy HH:mm"
        dateFormat.timeZone = NSTimeZone.system
        let now = self.formataComHora
        return dateFormat.string(from: now as Date)
    }
    
    var horaFormatada: String{
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "HH:mm"
        dateFormat.timeZone = NSTimeZone.system
        let now = self.formataComHora
        return dateFormat.string(from: now as Date)
    }
    
    var dataFormatadaComHoraFilename: String{
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "ddMMyyyy-HHmm"
        dateFormat.timeZone = NSTimeZone.system
        let now = self.formataComHora
        return dateFormat.string(from: now as Date)
    }

    var dataFormatadaMesAno: String{
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MMM - yyyy"
        dateFormat.timeZone = NSTimeZone.system
        let now = self.formataComHora
        return dateFormat.string(from: now as Date)
    }

}
