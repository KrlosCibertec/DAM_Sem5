//
//  ViewController.swift
//  Sem5
//
//  Created by krlos90 on 14/10/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    let diasSemana = ["Lunes", "Martes", "Miercoles", "Jueves", "Viermes", "Sabado", "Domingo"]
    
    private var diaSelecionado: String!
    
    @IBOutlet weak var txtEdad: UITextField!
    @IBOutlet weak var sgEstado: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Al cargar la pantalla que almacene el primer valor
        diaSelecionado = self.diasSemana[0]
        
    }


    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return diasSemana.count
    }
    
    //Mètodo heredado de uipickerviewdelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //El row es el paràmetro que se le pasa al mètodo y que proviene del numberOfRowsInComponent
        return diasSemana[row] //row proviene pero como paràmetro
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        diaSelecionado = diasSemana[row]
    }
    
    //Enviar atributos a la otra vista
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Usando if
        if let destino2 = segue.destination as? DetalleController {
            
        }
        
        //Usando switch
        switch segue.destination {
            case is DetalleController:
            let destino = segue.destination as! DetalleController
            
            destino.diaSemana = diaSelecionado
            let edad = txtEdad.text ?? ""
            let estadoIndex = sgEstado.selectedSegmentIndex
            var estado = ""
            if (estadoIndex == 0) {
                estado = "Estudiante"
            } else {
                estado = "Trabajador"
            }
            
            var bono:String = "No tiene bono"
            if let edadNum = Int(edad) {
                if edadNum < 40 {
                    if estadoIndex == 0 {
                        bono = "Bono estatal al estudiante s/ 1,000"
                    }
                } else if edadNum >= 40 && edadNum <= 60 {
                    if estadoIndex == 1 {
                        bono = "Bono estatal al trabajador de s/ 300"
                    }
                }
            }
            
            destino.estado = estado
            destino.edad = edad
            destino.bono = bono
            
            default: break
        }
    }
}

