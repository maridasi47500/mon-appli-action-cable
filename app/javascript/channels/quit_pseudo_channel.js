import consumer from "channels/consumer"

consumer.subscriptions.create({ channel: "QuitPseudoChannel" }, {
	  received(data) {
 // Called when the subscription is ready for use on the server
   this.appendLine(data)
      },
 
           appendLine(data) {
                    // Called when the subscription has been terminated by the server
                                        console.log(data) 
                                                                            const element = document.querySelector("[data-user-id='"+data["user"]+"']")
                                                                                         if (element !== null){
 
                                                                                                                                          element.outerHTML=""

                                                                                                                                                       }
                                                                                                                                                                                                          }
 
 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       });
