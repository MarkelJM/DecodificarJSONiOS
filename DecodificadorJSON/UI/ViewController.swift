//
//  ViewController.swift
//  DecodificadorJSON
//
//  Created by Markel Juaristi on 7/1/23.
//

import UIKit

struct Peticiones: Codable{
    /* el nombre de las variables debe llamarse exactamente igual a como se llama en el JSON*/
    var results: [Peticion] /* como results es una matriz con varios tipos de datos necesitamos crear un nuevo objeto para clasificarlos*/
}

struct Peticion: Codable {
    var title : String
    var body: String
    var signatureCount: Int
}

class ViewController: UIViewController {
    
    var peticiones = [Peticion]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://www.hackingwithswift.com/samples/petitions-1.json"
        
        /*crear una variable segura*/
        if let url = URL(string: url){
            /* es necesario poner ?, porque quizas no exista y sale un error*/
            if let datosListosAnalizar = try? Data(contentsOf: url){
                //listos para analizar el objeto JSON
                analizarJSON(objJSON: datosListosAnalizar)
            }
        }
    }
    
    func analizarJSON(objJSON : Data){
        let decodificador = JSONDecoder()
        /*vamos a transformar los datos JSON a un objeto que hemos creado(Peticiones(self es necesario para decir que esta misma))*/
        if let listaPeticionesJSON = try? decodificador.decode(Peticiones.self, from: objJSON){
            print("numero de peticiones : \(listaPeticionesJSON.results.count)")
            peticiones = listaPeticionesJSON.results
            print(peticiones[0].title)
            print(peticiones[0].body)
            print(peticiones[0].signatureCount)        }
        
    }


}

