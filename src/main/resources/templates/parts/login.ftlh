<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name: </label>
            <div class="col-sm-5">
                <input type="text" name="username" minlength="3" required class="form-control"
                       placeholder="Enter email"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password: </label>
            <div class="col-sm-5">
                <input type="password" pattern="[a-zA-Z1-9]{3,20}" name="password" required class="form-control"
                       placeholder="Password"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <#if !isRegisterForm>
            <a href="/registration">Sign In</a>
        </#if>
        <button type="submit" class="btn btn-primary">
            <#if !isRegisterForm>Log In
            <#else>Sign in
            </#if>
        </button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">Sign out</button>
    </form>
</#macro>