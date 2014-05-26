package example001



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RecordController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    //def beforeInterceptor = [action:this.&auth,except:['login', 'logout',]]

//    def auth() {
//        if (!session.users) {
//
//            redirect(controller: "login", action: "login")
//            return false
//        }
//
//
//        if (session.isadmin!=true) {
//            flash.message = "admins only"
//            redirect(controller: "login", action: "login")
//            return false
//        }
//    }


    def logout()
    {
        flash.message = "Goodbye ${session.users.name}" session.users = null
        redirect(action:"login")
    }

    def index() {
        params.max = 10
        //respond Record.findByUsers(Users.findByName(session.name.toString())),model:[recordInstanceCount: Record.findAllByUsers(Users.findByName(session.name.toString())).size()]
        respond Record.list(params), model:[recordInstanceCount: Record.count()]
    }

    def show(Record recordInstance) {
        respond recordInstance
    }




        def create() {


        if (session.name==null||session.name=="") {
            flash.message = "please login!"
            redirect(controller: "login")
            return false
        }


//        if (session.isadmin!="true") {
//            flash.message = "admins only"
//            redirect(controller: "login")
//            return false
//        }

        respond new Record(params)
    }

    @Transactional
    def save(Record recordInstance,RecordCommand cmd) {

        if(cmd.hasErrors())
        {
            flash.message = "end time should  >= start time"
            redirect(action: 'create')
            return
        }
        if (recordInstance == null) {
            notFound()
            return
        }

        if (recordInstance.hasErrors()) {
            respond recordInstance.errors, view:'create'
            return
        }

        recordInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'recordInstance.label', default: 'Record'), recordInstance.id])
                redirect recordInstance
            }
            '*' { respond recordInstance, [status: CREATED] }
        }
    }

    def edit(Record recordInstance) {
        respond recordInstance
    }

    @Transactional
    def update(Record recordInstance) {
        if (recordInstance == null) {
            notFound()
            return
        }

        if (recordInstance.hasErrors()) {
            respond recordInstance.errors, view:'edit'
            return
        }

        recordInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Record.label', default: 'Record'), recordInstance.id])
                redirect recordInstance
            }
            '*'{ respond recordInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Record recordInstance) {

        if (recordInstance == null) {
            notFound()
            return
        }

        recordInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Record.label', default: 'Record'), recordInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'recordInstance.label', default: 'Record'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

class RecordCommand {

    Date starttime
    Date endtime

    static constraints = {

        endtime validator: { val, obj ->
            val >= obj.starttime

        }
    }
}
