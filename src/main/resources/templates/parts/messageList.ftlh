<div class="card-columns">
    <#list messages as message>
        <div class="card my-3">
            <#if message.filename??>
                <img class="card-img-top" src="img/messages/${message.filename}" alt="Card image cap"
                     style="width:100%">
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