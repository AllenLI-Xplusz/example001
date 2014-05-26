package example001

class Users {

    String name
    String password
    String role = "users"

    static hasMany = [record:Record]

    static constraints = {
        name(blank: false ,unique: true)

        password(blank:false, password:true )
        role(inList:["admin", "users"])

    }
    static transients = ['admin']

    boolean isAdmin(){
        return role == "admin"
    }

}