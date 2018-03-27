//
//  EventHandler.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 23/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import Foundation
import EventKit
class EventHandler {
    
    
    
    private static var instance: EventHandler?
    private let eventStore = EKEventStore()
    
    init() {
        requestAuth()
    }
    
    func requestAuth(){
        if (EKEventStore.authorizationStatus(for: .event) != EKAuthorizationStatus.authorized) {
            self.eventStore.requestAccess(to: .event, completion: {
                granted, error in
                
            })
        }
    }
    
    // Singleton pattern
    static func getInstance() -> EventHandler {
        guard let instanceEventHandler = EventHandler.instance else {
            
            
            
            
            
            return EventHandler()
        }
        return instanceEventHandler
    }
    
    func createTraitementEvent(title: String, startDate: NSDate, endDate: NSDate, heureTraitement: NSDate) {
        let event = EKEvent(eventStore: eventStore)
        let calendar = NSCalendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: startDate as Date)
        let date2 = calendar.startOfDay(for: endDate as Date)
        
        
        let ecart = calendar.dateComponents([.day], from: date1, to: date2)
        print (ecart)
        event.title = title
        event.startDate = startDate as Date
        event.endDate = startDate.addingTimeInterval(1800) as Date
        event.calendar = self.eventStore.defaultCalendarForNewEvents
        
        if(ecart.day ?? 0 > 0){
            
            let rule = EKRecurrenceRule(recurrenceWith: .daily, interval: 1, end: EKRecurrenceEnd(occurrenceCount: ecart.day!))
            event.addRecurrenceRule(rule)
            
        }
        do {
            try self.eventStore.save(event, span: .thisEvent)
        } catch {
            print("Bad things happened")
        }
        
        
        
        
    }
    
    
}
