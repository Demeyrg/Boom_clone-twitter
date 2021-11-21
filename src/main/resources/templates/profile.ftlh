<#import "parts/common.ftlh" as c>

<@c.page>
    <h5>${username}</h5>
    ${message?if_exists}
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Email: </label>
            <div class="col-sm-5">
                <input type="email" name="email" minlength="3" class="form-control" placeholder="some@some.com" value="${email!''}"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password: </label>
            <div class="col-sm-5">
                <input type="password" pattern="[a-zA-Z1-9]{3,20}" name="password" class="form-control"
                       placeholder="Password"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-success">Save</button>
    </form>

</@c.page>