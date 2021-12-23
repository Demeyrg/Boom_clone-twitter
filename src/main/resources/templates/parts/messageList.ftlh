<#include "security.ftlh">

<div class="card-columns" id="message-list">
    <#list messages as message>
        <div class="card my-3" data-id="${message.id}">
            <#if message.filename??>
                <img class="card-img-top" src="../img/messages/${message.filename}" alt="Card image cap"
                     style="width:100%"/>
            </#if>

            <div class="m-2">
                <h5 class="card-title">
                    <a href="/user-messages/${message.author.id}">${message.authorName}</a>
                </h5>

                <p class="card-text"><span>${message.text}</span></p>


            </div>
            <div class="card-footer text-muted">
                <i>#${message.tag}</i>
                <#if message.author.id == currentUserId>
                    <a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">
                        Edit
                    </a>
                </#if>
            </div>
        </div>
    <#else>
        No messages with this tag
    </#list>
</div>