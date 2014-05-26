<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Users Login</title>
</head>

<body>
<div class="nav">

</div>

<div class="body">
    <h1>User login</h1>
    <g:if test="${flash.message}">
        <div class="errors">${flash.message}</div>
    </g:if>


    <g:form  controller="login"  action="loginaction"  method="post" >

            <table>
                <tbody>
                <tr class='prop'>
                    <td valign='top' class='name'><label for='name'>Name:</label></td>
                    <td valign='top' class='value ${hasErrors(bean: user, field: 'name', 'errors')}'>
                        <input type='text' name='name' value="${user?.name?.encodeAsHTML()}"/></td>
                </tr>
                <tr class='prop'><td valign='top' class='name'><label for='password'>
                    Password:</label></td><td valign='top' class='value ${hasErrors(bean: user, field: 'password',
                        'errors')}'><input type='password' name='password' value="${user?.password?.encodeAsHTML()}"/>
                </td>
                </tr>



                </tbody>
            </table>
        </div>

        <div class="buttons">
            <span class="formButton">
                <input type="submit" value="Login" name="Login" />
            </span>
        </div>
</g:form>

</div>
</body>

</html>