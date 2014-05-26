class UrlMappings {

    static mappings = {

        '/login/addrecord'(controller:'record',action:'create')

        '/login/adduser'(controller:'users',action:'create')


        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/"(view:'/login/login')

        "500"(view:'/error')
        "404"(view:'/notfound')
        // "/face/hehe"(view:"/face/fails")
    }
}
