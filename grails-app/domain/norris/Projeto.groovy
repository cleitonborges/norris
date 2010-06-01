package norris

class Projeto {
	
    String nome
    
    static hasMany = [clientes:Cliente]

    static constraints = {
       nome(nullable:false, unique:true)
    }
    
    String toString()
    {
    	    return "${this.nome}"
    }	    
}
