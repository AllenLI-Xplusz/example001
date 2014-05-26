package example001



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsersController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Users.list(params), model:[usersInstanceCount: Users.count()]
    }

    def show(Users usersInstance) {
        respond usersInstance
    }





    def create() {
        if (session.name==null||session.isadmin!="true") {
            flash.message = "u are not admin!"
            redirect(controller: "login")
            return false
        }

        respond new Users(params)
    }

    @Transactional
    def save(Users usersInstance) {
        if (usersInstance == null) {
            notFound()
            return
        }

        if (usersInstance.hasErrors()) {
            respond usersInstance.errors, view:'create'
            return
        }


        print usersInstance.name
        print usersInstance.password
        print usersInstance.id

        usersInstance.password = usersInstance.password.encodeAsSHA()
        print usersInstance.password

        usersInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usersInstance.label', default: 'Users'), usersInstance.id])
                redirect usersInstance
            }
            '*' { respond usersInstance, [status: CREATED] }
        }
    }

    def edit(Users usersInstance) {
        respond usersInstance
    }

    @Transactional
    def update(Users usersInstance) {
        if (usersInstance == null) {
            notFound()
            return
        }

        if (usersInstance.hasErrors()) {
            respond usersInstance.errors, view:'edit'
            return
        }

        usersInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Users.label', default: 'Users'), usersInstance.id])
                redirect usersInstance
            }
            '*'{ respond usersInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Users usersInstance) {

        if (usersInstance == null) {
            notFound()
            return
        }

        usersInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Users.label', default: 'Users'), usersInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usersInstance.label', default: 'Users'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
