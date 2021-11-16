<#macro login path>
    <form action="${path}" method="post">
        <div><label> User Name: <input type="text" name="username" minlength="3" required/> </label></div>
        <br>
        <div><label> Password: <input type="password" pattern="[a-zA-Z1-9]{3,20}" name="password" required/></label></div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <br>
        <div><input type="submit" value="Sign In"/></div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Sign out"/>
    </form>
</#macro>