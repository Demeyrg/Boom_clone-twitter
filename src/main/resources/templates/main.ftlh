<#import "parts/common.ftlh" as c>

<@c.page>
    <br>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <label for="inputTag">Search by tag</label>
                <input type="text" name="filter" class="form-control mr-2 ml-2" id="inputTag"
                       value="${filter?if_exists}" placeholder="Enter the tag">
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>
    </div>

    <p>
        <a class="btn btn-primary" data-toggle="collapse" href="#addNewMessage" role="button" aria-expanded="false"
           aria-controls="#addNewMessage">
            Add new Message
        </a>
    </p>

    <div class="collapse" id="addNewMessage">
        <div class="form-group">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" name="text" class="form-control" minlength="1" maxlength="3000"
                           placeholder="Add Message" required/>
                </div>
                <div class="form-group">
                    <input type="text" name="tag" class="form-control" minlength="2" maxlength="30"
                           placeholder="Add Tag" required/>
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" class="custom-file-input" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>

    <br>

    <div>Список сообщений:</div>
    <br>

    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <#if message.filename??>
                    <img class="card-img-top" src="/img/${message.filename}" alt="Card image cap" style="width:100%">
                </#if>
                <div class="m-2">
                    <h5 class="card-title">${message.authorName}</h5>
                    <p class="card-text">${message.text}</p>
                </div>
                <div class="card-footer text-muted">
                    #${message.tag}
                </div>
            </div>
        <#else>
            No messages with this tag
        </#list>
    </div>


</@c.page>