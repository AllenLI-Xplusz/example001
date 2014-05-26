package example001

class FooterTagLib {
    static defaultEncodeAs = 'html'
    //static encodeAsForTags = [tagName: 'raw']

    def thisyear=
            {
                out << new Date().format("yyyy")

            }

    def thatyear={  attrs, body ->

        out<< new java.text.SimpleDateFormat(attrs.format).format(attrs.date)

    }

    def copyright={attrs ,body->
        out <<"&copyright;"+attrs.startyear+"-"+thisyear()+""+body('<br>')

    }



    def isAdmin = { attrs, body ->
        def user = attrs.user
        if (1!=1) {
            out << body()
        }
    }

    def repeat = { attrs, body ->
        def var = attrs.var ?: "num"

        attrs.times?.toInteger()?.times { num ->

            out << body((var):num)
        }
    }



}
