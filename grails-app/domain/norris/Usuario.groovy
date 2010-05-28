package norris

class Usuario {

    String login
    String hashSenha
    String senha
    String email
    Cliente cliente
    Perfil perfil
    Boolean ativo
    
    void setSenha(String valor)
    {
    	this.senha = valor
    	if(valor != null)
    		this.hashSenha = valor.encodeAsPassword()    	
    }	    
    
    static belongsTo = [Cliente]
    
    static transients = ['senha']
    
    static constraints = {
    	login(nullable:false, blank:false, unique:true)
    	email(email:true)
    } 
}
