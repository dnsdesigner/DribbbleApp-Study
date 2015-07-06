//
//  DribbleHTTPClient.swift
//  DribbbleApp
//
//  Created by Dennis de Oliveira on 29/06/15.
//  Copyright (c) 2015 Dennis Oliveira. All rights reserved.
//

import UIKit

class DribbleHTTPClient: NSObject {
    
    // Client Access Token
    // 3fefde31931858b0d4671d9993c891df04bc2994d4b46162a783c78c42a19462
    
    private let baseURLString = "https://api.dribbble.com/v1/"
    private let accessToken = "3fefde31931858b0d4671d9993c891df04bc2994d4b46162a783c78c42a19462"
    
    func getShots(completation: ((Array<Shot>) -> Void)!) {
        
        // URL de acesso
        var URLString = "\(self.baseURLString)/shots?access_token=\(self.accessToken)"
        
        let session = NSURLSession.sharedSession()
        let shotsURL = NSURL(string: URLString)
        
        // Cria uma sessão com a url e usa uma clousure para usar como callback
        var task = session.dataTaskWithURL(shotsURL!) {
            (data, response, error) -> Void in
            
            if error != nil {
                println(error.localizedDescription)
            } else {
                
                println("Sessão iniciada com sucesso!")
                
                var error: NSError?
                
                // Obtém os dados serializados e transforma em um objeto para ser tratado no sistema
                var shotsData = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &error) as! NSArray
                
                var shots = Array<Shot>()
                
                // Cria um array de objetos Shot para poder manipular no sistema
                for shot in shotsData {
                    let shot = Shot(data: shot as! NSDictionary)
                    shots.append(shot)
                }
                
                // Cria uma tarefa assincrona para devolver array de shots
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                
                dispatch_async(dispatch_get_global_queue(priority, 0)){
                    dispatch_async(dispatch_get_main_queue()) {
                        completation(shots)
                        println("Dispatch finalizado shots tem \(shots.count) elementos")
                    }
                }
                
            }
        }
        
        task.resume()
        
    }
    
}