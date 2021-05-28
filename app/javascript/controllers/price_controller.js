import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'amount' ];

  refresh() {
    fetch('/arts', { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
      });
  }
}
