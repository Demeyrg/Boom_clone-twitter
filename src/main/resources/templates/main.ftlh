<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div>
        <@l.logout/>
    </div>
    <br>
    <div>
        <form method="post">
            <input type="text" name="text" placeholder="Введите сообщение"/>
            <input type="text" name="tag" placeholder="Добавьте Тэг"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit">Добавить</button>
        </form>
    </div>
    <br>
    <div>Список сообщений:</div>
    <br>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter}" placeholder="Введите Тэг">
        <button type="submit">Найти</button>
    </form>
    <br>
    <#list messages as message>
        <div>
            <b>${message.id}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <strong>${message.authorName}</strong>
        </div>
    <#else>
        No messages with this tag
    </#list>

</@c.page>