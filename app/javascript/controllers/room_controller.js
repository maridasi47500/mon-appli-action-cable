import  { application } from "controllers/application";
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

	sendmessage(){
		        var form=$("#message-form");
		        $.ajax({url:form.attr("action"),type:form.attr("method"),data:form.serialize()});
		        return false;

}
}
