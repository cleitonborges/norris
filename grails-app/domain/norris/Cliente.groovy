package norris

class Cliente {

    String nome
    String razao
    BigInteger documento
    String telefone
    String endereco
    String url
    Boolean ativo
    
    static hasMany = [usuarios:Usuario, projetos:Projeto]
	
    static constraints = {
    	    nome(nullable:false, blank:false)
    	    documento(nullable:false, blank:false, unique:true)
    	    url(url:true)
    }
}
