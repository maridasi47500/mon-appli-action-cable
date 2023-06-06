function sendmessage(){
		        var form=$("#message-form");
		        $.ajax({url:form.attr("action"),type:form.attr("method"),data:form.serialize()});
		        return false;

};
