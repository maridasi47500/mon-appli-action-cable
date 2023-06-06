function sendmessage(){
		        var form=$("#message-form");
		        $.ajax({url:form.attr("action"),type:form.attr("method"),data:form.serialize()});
		        return false;

};
function choisirpseudo(ev){
		        var form=$(ev.target);
		        $.ajax({url:form.attr("href"),type:"POST"});
		        return false;
}
function quitterpseudo(ev){
		        var form=$(ev.target);
		        $.ajax({url:form.attr("href"),type:"POST"});
		        return false;
}
