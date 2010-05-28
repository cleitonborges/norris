package norris

class Projeto {
	
    String nome
    
    static constraints = {
    	  nome(nullable:false, blank:false, unique:true)
    }
}
