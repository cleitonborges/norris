package norris

class Perfil {

    String tipo
    
    static belongsTo = [Usuario]
    
    static hasMany = [usuarios:Usuario]
    
    static constraints = {
    	    tipo(nullable:false)
    }
    
    String toString()
    {
    	    return "${this.tipo}"
    }	    
}
