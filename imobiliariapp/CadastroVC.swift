//
//  CadastroVC.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 23/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation
import Alamofire

class CadastroVC : UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var tipoUsuario: UISegmentedControl!
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var sobrenome: UITextField!
    @IBOutlet weak var ddd: UITextField!
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var confirmacao: UITextField!
    @IBOutlet weak var termosUso: UISwitch!
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    var keyboardHeight : CGFloat = 0
    var fullHeight : CGFloat = 0
    
    override func viewDidLoad() {
        fullHeight = self.view.frame.height
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardShow:", name: UIKeyboardDidShowNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func keyboardShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize =  (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                keyboardHeight = keyboardSize.height
            }
        }
    }
    
    @IBAction func clickTela(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        let posicao = textField.frame.origin.y - 20
        scroll.setContentOffset(CGPointMake(0, posicao), animated: true)
        //scroll.setContentOffset(CGPointMake(0, keyboardHeight), animated: true)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        scroll.setContentOffset(CGPointMake(0,0), animated: true)
    }
    
    @IBAction func cadastrarClick(sender: AnyObject) {
        var erros = ""
        
        if (nome.text == "") || (sobrenome.text == "") || (ddd.text == "") || (telefone.text == "") || (email.text == "") || (senha.text == "") || (confirmacao.text == "") || (termosUso.on == false){
            erros += "- Todos os campos são obrigatórios"
        }
        
        if (senha.text?.characters.count < 6){
            if erros != ""{ erros += "\n" }
            
            erros += "- A senha deve ter no mínimo 6 caracteres"
        }
        
        if (senha.text != confirmacao.text){
            if erros != ""{ erros += "\n" }
            
            erros += "- A confirmação deve ser igual a senha"
        }
        
        if erros != ""{
            let alert = UIAlertController(title: "Erro na criação do usuário", message: erros, preferredStyle: UIAlertControllerStyle.Alert)
            
            let alertOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){(ACTION) in
                
            }
            
            alert.addAction(alertOK)
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else{
            var tipoString = "cliente"
            
            switch tipoUsuario.selectedSegmentIndex{
                case 1: tipoString = "cliente"
                case 2: tipoString = "corretor"
                case 3: tipoString = "construtor"
                default : "cliente"
            }
            
            let parametros : [String : AnyObject] = ["nome" : nome.text!, "sobrenome" : sobrenome.text!, "telefone" : telefone.text!, "email" : email.text!, "senha" : senha.text!, "tipo" : tipoString]
            
            Alamofire.request(.POST, Util.serverLocation + "/usuario/cadastraUsuario/", parameters: parametros).responseJSON{ response in
                
            }
        }
    }
    @IBAction func cancelarClick(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}