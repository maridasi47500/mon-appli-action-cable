import consumer from "channels/consumer"

consumer.subscriptions.create({ channel: "UserAppearanceChannel" }, {
	  received(data) {
 // Called when the subscription is ready for use on the server
   this.appendLine(data)
      },
 
           appendLine(data) {
                    // Called when the subscription has been terminated by the server
                                         const html = this.createLine(data)
                                                                            const element = document.querySelector("[data-user-id='"+data["userid"]+"']")
                                                                                         if (element !== null){
 
                                                                                                                                          element.outerHTML=(html)

											 }else{
												 //alert("ok")
                                                                            const el = $("#mypseudos")
												 el.append(html);
                                                                                                                                                       }
                                                                                                                                                                                                          },
 
                                                                                                                                                                                                                                                               createLine(data) {
                                                                                                                                                                                                                                                                                                                            return `
                                                                                                                                                                                                                                                                                                                                                                                                      <article data-user-id="${data["userid"]}" data-pseudo-id="${data["pseudoid"]}">                                                                           <img src="/uploads/${data["image"]}" width=50 height=50 />
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <p>${data["username"]}</p>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <p>${data["pseudobody"]}</p>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     </article>`
 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              }
 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       });
