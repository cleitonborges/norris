package norris

class Cliente {
	
    String nome
    String razao
    BigInteger documento
    String endereco
    String telefone
    String site
    
    static belongsTo = [Projeto]
    
    static hasMany = [usuarios:Usuario, projetos:Projeto]
    
    static constraints = {
    	    nome(nullable:false, blank:false, unique:true)
    	    documento(nullable:false, unique:true)
    	    site(url:true)
    }
    
    String toString()
    {
    	    return "${this.nome}"	    
    }	    
}
