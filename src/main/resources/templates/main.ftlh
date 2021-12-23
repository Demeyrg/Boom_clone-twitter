<#import "parts/common.ftlh" as c>

<@c.page>
    <br/>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <label for="inputTag">Search by tag</label>
                <input type="text" name="filter" class="form-control mr-2 ml-2" id="inputTag"
                       value="${filter?if_exists}" placeholder="Enter the tag"/>
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>
    </div>

    <br/>
    <h2 align="center">All messages:</h2>
    <br/>

    <#include "parts/messageEdit.ftlh" />

    <#include "parts/messageList.ftlh" />

</@c.page>