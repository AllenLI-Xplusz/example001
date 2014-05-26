package example001

import grails.converters.*;

class LoginController {


    def loginService

def index()
{

    render(view:"login")
}


    def loginaction() {
        Users u = new Users(params)


        print params
        print "u role"+u.role


        if (u.name && u.password) {
            //u.password.encodeAsSHA()
            def user = loginService.check(u)
         print "user"+user.toString()


            if (user!=null&&user.role=="users") {
                //def id = Users.findByName(u.name).id
                //flash.message = "welcome${id}"
                // render(view: "/employee/index", model: [miao: u])
                print u.isAdmin()
                session.name=u.name
                redirect (action:"addrecord")
                return
            }

            if(user!=null&&user.role=="admin"){
                session.name=u.name
                session.isadmin="true"
                flash.admin="true"
               // flash.error = "Invalid ${u.name} with ${u.password}"
                redirect (action:"adduser")
                return
            }

        }
        else{
            render(view:"/login/login")
            return
        }

    }
    def logout = {
        flash.message = "Goodbye ${session.users.name}"
        session.name = null
        redirect(action: "login")
    }


}
