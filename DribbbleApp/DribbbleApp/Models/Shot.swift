//
//  Shot.swift
//  DribbbleApp
//
//  Created by Dennis de Oliveira on 29/06/15.
//  Copyright (c) 2015 Dennis Oliveira. All rights reserved.
//

import Foundation

class Shot {
    
    // Propriedades do objeto
    var id: Int!
    var title: String!
    var date: String!
    var description: String!
    var commentsCount: Int!
    var likesCount: Int!
    var commentURL: String!
    var imageURL: String!
    
    var userName: String!
    var userAccount: String!
    
    var imageData: NSData?
    
    // Inicializador do objeto, faz o parsing dos dados recebidos
    init(data: NSDictionary) {
        
        // Recuperou os dados do Tipo Int diretamente
        self.id = data["id"] as! Int
        self.commentsCount = data["comments_count"] as! Int
        self.likesCount = data["likes_count"] as! Int
        
        self.commentURL = getStringFromJSON(data, key: "comments_url")
        self.title = getStringFromJSON(data, key: "title")
        
        let dateInfo = getStringFromJSON(data, key: "created_at")
        self.date = dateInfo
        
        let desc = getStringFromJSON(data, key: "description")
        self.description = desc
        
        // Dados que são dictionary eu crio uma variável a parte e retiro apenas os dados que preciso
        let images = data["images"] as! NSDictionary
        self.imageURL = getStringFromJSON(images, key: "normal")
        
        let user = data["user"] as! NSDictionary
        self.userName = getStringFromJSON(user, key: "name")
        self.userAccount = getStringFromJSON(user, key: "username")
    }
    
    
    // Função que pega os dados retornados e transforma em String
    private func getStringFromJSON(data: NSDictionary, key: String) -> String {
        let info: AnyObject? = data[key]
        
        if let info = data[key] as? String {
            return info
        }
        
        return ""
    }
    
}