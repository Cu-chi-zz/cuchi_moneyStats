$(document).ready(function(){
    let shown = false

    let exitBtn = document.createElement("button");
    exitBtn.className = "button center";
    exitBtn.id = "exitbtn";
    exitBtn.textContent = "CLOSE";
    exitBtn.onclick = function() { Exit() }
    document.getElementById("container").appendChild(exitBtn);


    $(document).on("keyup", function(e) 
    {
        if (e.key == "Escape") 
        {
            Exit()
        }
    });

    function Exit() 
    {
        $("body").fadeOut(250);
        shown = false
        $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
    }

    window.addEventListener("message", function(event) 
    {
        if (event.data.type == "menu") 
        {
            if (!shown) 
            {
                $("body").fadeIn(250);
                document.getElementById("bank").textContent = "$" + event.data.bank
                document.getElementById("cash").textContent = "$" + event.data.cash
                document.getElementById("black").textContent = "$" + event.data.black
                shown = true
            } 
            else 
            {
                Exit()
            }
        }
    });
});