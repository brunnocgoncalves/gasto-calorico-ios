//
//  profile.swift
//  gastoCalorico
//
//  Created by Brunno Goncalves on 19/12/16.
//  Copyright © 2016 brunnogoncalves. All rights reserved.
//

import Foundation

class Profile {
    private var _gender: String = "Masculino"
    private var _age: Int = 15
    private var _bodyWeight: Double = 80
    private var _heigth: Double = 1.80
    private var _nivelAtividade: String = "Inatividade"
    private var _name: String!
    private var _imc: Double!
    private var _imcZone: String!
    private var _idealWeight: Double!
    private var _tmb: Double!
    private var _get: Double!
    
    var name: String {
        get{
            return _name
        }
    }
    
    var nivelAtividade: String {
        get{
            return _nivelAtividade
        }
        
        set{
            _nivelAtividade = newValue
        }
    }
    
    var heigth: Double {
        get{
            return _heigth
        }
        set{
            _heigth = newValue
        }
    }
    
    var bodyWeight: Double {
        get{
            return _bodyWeight
        }
        set{
            _bodyWeight = newValue
        }
    }
    
    var age: Int {
        get{
            return _age
        }
        set{
            _age = newValue
        }
    }
    
    var gender: String {
        get{
            return _gender
        }
        set{
            _gender = newValue
        }
    }
    
    var imc: Double{
        get{
            _imc = _bodyWeight / (_heigth * _heigth)
            return _imc
        }
    }
    
    var imcZone: String{
        get{
            if _imc < 18 {
                _imcZone = "Baixo"
            } else if _imc >= 18 && _imc < 25{
                _imcZone = "Medio"
            } else if _imc >= 25 && _imc < 30{
                _imcZone = "Elevado"
            } else {
                _imcZone = "Muito Elevado"
            }
            return _imcZone
        }
    }
    
    var idealWeight: Double{
        get{
            let imc: Double = 22.5
            
            _idealWeight = imc * (_heigth * _heigth)
            return _idealWeight
        }
    }
    
    var tmb: Double{
        get{
            if _gender == "Masculino" {
                if _age <= 3 {
                    _tmb = 60.9 * _bodyWeight + 54;
                } else if _age >= 4 && _age <= 10 {
                    _tmb = 22.7 * _bodyWeight + 495;
                } else if _age >= 11 && _age <= 18 {
                    _tmb = 17.5 * _bodyWeight + 651;
                }
                else if _age >= 19 && _age <= 30 {
                    _tmb = 15.3 * _bodyWeight + 679;
                }
                else if _age >= 31 && _age <= 60 {
                    _tmb = 11.6 * _bodyWeight + 879;
                }
                else if _age > 60 {
                    _tmb = 13.5 * _bodyWeight + 487;
                }
            } else {
                if _age <= 3 {
                    _tmb = 61 * _bodyWeight + 51;
                } else if _age >= 4 && _age <= 10 {
                    _tmb = 22.5 * _bodyWeight + 449;
                } else if _age >= 11 && _age <= 18 {
                    _tmb = 12.2 * _bodyWeight + 746;
                }
                else if _age >= 19 && _age <= 30 {
                    _tmb = 14.7 * _bodyWeight + 496;
                }
                else if _age >= 31 && _age <= 60 {
                    _tmb = 8.7 * _bodyWeight + 829;
                }
                else if _age > 60 {
                    _tmb = 10.5 * _bodyWeight + 596;
                }
            }
            return _tmb
        }
    }
    
    var get: Double{
        get{
            var ratio: Double
            if _gender == "Masculino"{
                switch _nivelAtividade {
                case "INATIVIDADE":
                    ratio = 1.25
                case "LEVE":
                    ratio = 1.55
                case "MODERADA":
                    ratio = 1.78
                case "PESADA":
                    ratio = 1.82
                default:
                    ratio = 1.25
                }
            } else {
                switch _nivelAtividade {
                case "INATIVIDADE":
                    ratio = 1.3
                case "LEVE":
                    ratio = 1.56
                case "MODERADA":
                    ratio = 1.64
                case "PESADA":
                    ratio = 2.1
                default:
                    ratio = 1.3
                }
            }
            
            _get =  ratio * _tmb
            return _get
        }
    }
    
    init(name: String){
        self._name = name
    }
    
}
