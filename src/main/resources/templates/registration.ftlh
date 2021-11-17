<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
<div class="mb-1">
    <h2>Sign In</h2>
</div>
    ${message!" "}
<br>
    <@l.login "/registration" true/>
</@c.page>