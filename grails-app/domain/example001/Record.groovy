package example001

import org.grails.databinding.BindingFormat

class Record {

    String types
    String reason
    Date   starttime



    //@BindingFormat('MMddyyyy')
    Date   endtime


    static belongsTo =[users:Users]
    static constraints = {



        starttime(validator:{return (it >= new Date())})
        endtime(validator: {return  (it >= new Date())})



        types(inList:["Unpaid leave", "Marriage Leave", "Maternity Leave", "Condolence Leave", "Paternity Leave", "Sick Leave", "Annual Leave"])
        reason(blank:false, maxSize:20)


    }
}
