<#import "parts/common.ftlh" as c>

<@c.page>
    <br>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <label for="inputTag">Search by tag</label>
                <input type="text" name="filter" class="form-control mr-2 ml-2" id="inputTag" value="${filter?if_exists}" placeholder="Enter the tag">
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>
    </div>

    <br>

    <div>
        <form method="post" enctype="multipart/form-data">
            <input type="text" name="text" placeholder="Введите сообщение"/>
            <input type="text" name="tag" placeholder="Добавьте Тэг"/>
            <input type="file" name="file">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit">Добавить</button>
        </form>
    </div>
    <br>
    <div>Список сообщений:</div>
    <br>

    <#list messages as message>
        <div>
            <b>${message.id}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <strong>${message.authorName}</strong>
            <div>
                <#if message.filename??>
                    <img src="/img/${message.filename}">
                </#if>
            </div>
        </div>
    <#else>
        No messages with this tag
    </#list>

</@c.page>