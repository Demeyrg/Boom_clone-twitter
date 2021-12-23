<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name: </label>
            <div class="col-sm-5">
                <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid','')}"
                       placeholder="User name"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>

        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Email: </label>
                <div class="col-sm-5">
                    <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                           class="form-control ${(emailError??)?string('is-invalid','')}"
                           placeholder="some@some.com"/>
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>
        </#if>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password: </label>
            <div class="col-sm-5">
                <input type="password" name="password"
                       class="form-control ${(passwordError??)?string('is-invalid','')}"
                       placeholder="Password"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>

        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Password: </label>
                <div class="col-sm-5">
                    <input type="password" name="passwordTwo"
                           class="form-control ${(passwordTwoError??)?string('is-invalid','')}"
                           placeholder="Retype password"/>
                    <#if passwordTwoError??>
                        <div class="invalid-feedback">
                            ${passwordTwoError}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"></label>
                <div class="col-sm-5 mb-2">
                    <div class="g-recaptcha" data-sitekey="6LeIF1gdAAAAAEIkYow6FJYpDX3cIvyLWmcdf2b_"></div>
                    <#if captchaError??>
                        <div class="alert alert-danger mt-1" role="alert">
                            ${captchaError}
                        </div>
                    </#if>
                </div>
            </div>
        </#if>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
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
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Sign out</button>
    </form>
</#macro>