package norris

class Perfil {

    String tipo
    
    static hasMany = [usuarios:Usuario]
    
    static constraints = {
    	tipo(nullable:false, blank:false, unique:true)	    
    }
}
