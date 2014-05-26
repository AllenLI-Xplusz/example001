package example001

import grails.transaction.Transactional

@Transactional
class LoginService {

    def serviceMethod() {

    }

    boolean transaction = true
    def check(Users)
    {  Users.password=Users.password.encodeAsSHA()
        def u=Users.findWhere(name:Users.name,password:Users.password)
        return u
    }




}

