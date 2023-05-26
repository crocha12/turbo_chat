import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const messages = document.getElementById('messages');
    messages.addEventListener('DOMNodeInserted', this.resetScroll);
    this.resetScroll();
  }

  disconnect() {

  }

  resetScroll() {
    messages.scrollTop = messages.scrollHeight - messages.clientHeight;
  }
}
