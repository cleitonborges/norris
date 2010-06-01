package norris

class ProjetoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [projetoInstanceList: Projeto.list(params), projetoInstanceTotal: Projeto.count()]
    }

    def create = {
        def projetoInstance = new Projeto()
        projetoInstance.properties = params
        return [projetoInstance: projetoInstance]
    }

    def save = {
        def projetoInstance = new Projeto(params)
        if (projetoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'projeto.label', default: 'Projeto'), projetoInstance.id])}"
            redirect(action: "show", id: projetoInstance.id)
        }
        else {
            render(view: "create", model: [projetoInstance: projetoInstance])
        }
    }

    def show = {
        def projetoInstance = Projeto.get(params.id)
        if (!projetoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'projeto.label', default: 'Projeto'), params.id])}"
            redirect(action: "list")
        }
        else {
            [projetoInstance: projetoInstance]
        }
    }

    def edit = {
        def projetoInstance = Projeto.get(params.id)
        if (!projetoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'projeto.label', default: 'Projeto'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [projetoInstance: projetoInstance]
        }
    }

    def update = {
        def projetoInstance = Projeto.get(params.id)
        if (projetoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (projetoInstance.version > version) {
                    
                    projetoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'projeto.label', default: 'Projeto')] as Object[], "Another user has updated this Projeto while you were editing")
                    render(view: "edit", model: [projetoInstance: projetoInstance])
                    return
                }
            }
            projetoInstance.properties = params
            if (!projetoInstance.hasErrors() && projetoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'projeto.label', default: 'Projeto'), projetoInstance.id])}"
                redirect(action: "show", id: projetoInstance.id)
            }
            else {
                render(view: "edit", model: [projetoInstance: projetoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'projeto.label', default: 'Projeto'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def projetoInstance = Projeto.get(params.id)
        if (projetoInstance) {
            try {
                projetoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'projeto.label', default: 'Projeto'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'projeto.label', default: 'Projeto'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'projeto.label', default: 'Projeto'), params.id])}"
            redirect(action: "list")
        }
    }
}
