package norris

class Usuario {

    String login
    String hashSenha
    String email
    Boolean ativo
    
    static belongsTo = [Cliente]
    
    static hasMany = [access:Perfil]
    
    static constraints = {
    	    login(nullable:false, unique:true)
    	    email(email:true)
    }
    
    String toString()
    {
    	    return "${this.login}"	    
    }	    
    
}
