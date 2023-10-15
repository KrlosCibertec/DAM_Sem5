//
//  DetalleController.swift
//  Sem5
//
//  Created by krlos90 on 14/10/23.
//

import UIKit

class DetalleController: UIViewController {

    @IBOutlet weak var lblEdad: UILabel!
    @IBOutlet weak var lblDiaSemana: UILabel!
    @IBOutlet weak var lblEstado: UILabel!
    @IBOutlet weak var lblBono: UILabel!
    
    var diaSemana: String!
    var estado: String!
    var edad:String!
    var bono:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblEdad.text = edad
        lblDiaSemana.text = diaSemana
        lblEstado.text = estado
        lblBono.text = bono
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
