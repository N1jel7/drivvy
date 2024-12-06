<!DOCTYPE html>
<html>
<body>
<#list dialogues as dialog>
    <div>
        <a href="/dialogues/${dialog.id}">${dialog.name}, ${dialog.lastMessage}</a>
    </div>
</#list>
</body>
</html>