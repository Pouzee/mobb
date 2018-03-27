//
//  NotificationHandler.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 27/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationHandler{
    private static var instance: NotificationHandler?
    

    init() {
       
        }

    // Singleton pattern
    static func getInstance() -> NotificationHandler {
        guard let instanceNotificationHandler = NotificationHandler.instance else {
        
        
        
        
        
            return NotificationHandler()
        }
        return instanceNotificationHandler
    }
    
    func createStateNotification(date : Date){
        let oui = UNNotificationAction(identifier: "oui", title: "oui", options: .destructive)
        let non = UNNotificationAction(identifier: "non", title: "non", options: .destructive)
        let dyskinesie = UNNotificationAction(identifier: "dyskinesie", title: "dyskinesie", options: .destructive)
    
        let categorie = UNNotificationCategory(identifier: "cat", actions: [oui,non,dyskinesie], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([categorie])
    
        let content = UNMutableNotificationContent()
        content.title="Alerte etat"
        content.body="Vous sentez vous bien ?"
        content.categoryIdentifier="cat"
    
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "any", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    
    func createTraitementNotification(date : DateComponents){
        let oui = UNNotificationAction(identifier: "ouiTraitement", title: "oui", options: .foreground)
        let non = UNNotificationAction(identifier: "nonTraitement", title: "non, plus tard", options: .foreground)
        let categorie = UNNotificationCategory(identifier: "cat", actions: [oui,non], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([categorie])
       
        let content = UNMutableNotificationContent()
        content.title="Alarme médicament"
        content.body="As-tu pris ton medicament ?"
        content.categoryIdentifier="cat"
        
        
        print(date)
        print(Date())
        
        //let interval = date.timeIntervalSince(Date()) + 60*5
         //print(interval)
        var dateuh = date
        var dateuhh = DateComponents()
        dateuhh.month = date.month
        dateuhh.day = date.day
        dateuhh.hour = date.hour
        dateuhh.minute = date.minute! + 1
        dateuhh.second =  date.second
        dateuhh.month = date.month
        //dateuh.hour = dateuh.hour + 1
        dateuh.minute = dateuh.minute! + 1
        dateuh.quarter = 1
        print(dateuhh)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateuhh, repeats: false)
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "any", content: content, trigger: trigger)
        print(trigger.nextTriggerDate()!)
        
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func createSecondTraitementNotification(){
        let oui = UNNotificationAction(identifier: "ouiRappelTraitement", title: "oui", options: .foreground)
        let non = UNNotificationAction(identifier: "nonRappelTraitement", title: "j'ai oublié", options: .foreground)
        let categorie = UNNotificationCategory(identifier: "cat", actions: [oui,non], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([categorie])
        let content = UNMutableNotificationContent()
        content.title="Alarme médicament"
        content.body="As-tu pris ton medicament ?"
        content.categoryIdentifier="cat"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60*5, repeats: false)
        let request = UNNotificationRequest(identifier: "any", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func createRdvNotification(date : DateComponents, titre : String){
        
        
        let content = UNMutableNotificationContent()
        content.title="Alarme rendez-vous"
        content.body="Tu as un rendez-vous avec ton " + titre + "prépare toi"
        content.categoryIdentifier="cat"
        
        
        
        var dateuh = date
        var dateuhh = DateComponents()
        dateuhh.month = date.month
        dateuhh.day = date.day
        dateuhh.hour = date.hour
        dateuhh.minute = date.minute! + 1
        dateuhh.second =  date.second
        dateuhh.month = date.month
        dateuh.minute = dateuh.minute! + 1
        dateuh.quarter = 1
        print(dateuhh)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateuhh, repeats: false)
        let request = UNNotificationRequest(identifier: "any", content: content, trigger: trigger)
        print(trigger.nextTriggerDate()!)
        
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func createActiviteNotification(date: DateComponents, titre : String){
        let content = UNMutableNotificationContent()
        content.title="Alarme activité"
        content.body="Tu dois aller faire ton " + titre + " prépare toi"
        content.categoryIdentifier="cat"
        
        
        
        var dateuh = date
        var dateuhh = DateComponents()
        dateuhh.month = date.month
        dateuhh.day = date.day
        dateuhh.hour = date.hour
        dateuhh.minute = date.minute! + 1
        dateuhh.second =  date.second
        dateuhh.month = date.month
        dateuh.minute = dateuh.minute! + 1
        dateuh.quarter = 1
        print(dateuhh)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateuhh, repeats: false)
        let request = UNNotificationRequest(identifier: "any", content: content, trigger: trigger)
        print(trigger.nextTriggerDate()!)
        
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
