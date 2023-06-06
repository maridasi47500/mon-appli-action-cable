import consumer from "channels/consumer"

consumer.subscriptions.create({ channel: "ChatChannel", room: $("#roomname").html() }, {
  received(data) {
    // Called when the subscription is ready for use on the server
	      this.appendLine(data)
  },

  appendLine(data) {
    // Called when the subscription has been terminated by the server
	    const html = this.createLine(data)
	      const element = document.querySelector("[data-chat-room='"+$("#roomname").html()+"']")

	      element.insertAdjacentHTML("beforeend", html)
  },

  createLine(data) {
        return `
	        <article class="chat-line">
		          <span class="speaker">${data["sent_by"]}</span>
		          <span class="body">${data["body"]}</span>
		        </article>
		      `
  }
});
const chat=consumer.subscriptions.create({ channel: "ChatChannel", room: $("#roomname").html() }, {
  received(data) {
    // Called when the subscription is ready for use on the server
	      this.appendLine(data)
  },

  appendLine(data) {
    // Called when the subscription has been terminated by the server
	    const html = this.createLine(data)
	      const element = document.querySelector("[data-chat-room='"+$("#roomname").html()+"']")
	      element.insertAdjacentHTML("beforeend", html)
  },

  createLine(data) {
        return `
	        <article class="chat-line">
		          <span class="speaker">${data["sent_by"]}</span>
		          <span class="body">${data["body"]}</span>
		        </article>
		      `
  }
});
const chatChannel = consumer.subscriptions.create({ channel: "ChatChannel", room: $("#roomname").html() }, {
	  received(data) {
		      console.log("data :: ",data);
		     }
		   });
consumer.subscriptions.create({ channel: "ChatChannel", room: $("#roomname").html() });
//consumer.subscriptions.create({ channel: "ChatChannel", room: $("#roomname").html() });
chatChannel.send({ sent_by: "Paul", body: "This is a cool chat app." });
chat.send({ sent_by: "Paul", body: "This is a cool chat app." });
