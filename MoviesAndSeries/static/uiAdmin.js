class UiAdmin {
  constructor() {
    this.input_genre_to_insert = document.querySelector(
      "#input-genre-to-insert"
    );
    this.select_genre_to_delete = document.querySelector(
      "#select-genre-to-delete"
    );
    this.btnInsert = document.querySelector("#insert-genre");
    this.btnDelete = document.querySelector("#delete-genre");
    this.container = document.querySelector(".container");
    this.genre_div = document.querySelector("#genre-div");
  }

  showMessage(msg, type) {
    let div = document.createElement("div");
    div.className = `alert msg alert-${type}`;
    div.textContent = msg;
    this.container.insertBefore(div, this.genre_div);
    setTimeout(() => {
      document.querySelector(".alert").remove();
    }, 3000);
  }

  post(url, data) {
    var xmlhttp = new XMLHttpRequest(); // new HttpRequest instance
    var theUrl = url;

    xmlhttp.open("POST", theUrl, true);

    xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xmlhttp.send(JSON.stringify(data));
    xmlhttp.onload = function() {
      if (xmlhttp.status === 200) {
        console.log("Accepted");
      }
    };
  }

  async insertGenre(genre) {
    let response = await fetch(`http://127.0.0.1:8000/newgenre/${genre}`);
    let r = await response.json();
  }

  async showGenreToDelete() {
    let response = await fetch("http://127.0.0.1:8000/genres");
    let r = await response.json();

    for (let i = 0; i < r.length; i++) {
      var option = document.createElement("option");
      option.text = r[i].gen_title;
      this.select_genre_to_delete.add(option, i);
    }
  }

  async deleteGenre(genre) {
    let response = await fetch(`http://127.0.0.1:8000/delgenre/${genre}`);
    let r = await response.json();
    if (r.msg == "genre deleted correctly!!") {
      alert("deleted");
    } else {
      alert("this genre wasn't deleted");
    }
  }

  async showUnacceptedComments() {
    let response = await fetch(`http://127.0.0.1:8000/unaccepted`);
    let r = await response.json();
    let l = r.data.length;

    console.log(l);
    let tbody = document
      .querySelector("#comments_table")
      .getElementsByTagName("tbody")[0];
    for (let i = 0; i < l; i++) {
      let row = tbody.insertRow(0);
      let from = row.insertCell(0);
      var newText2 = document.createTextNode(`${r.data[i].comment}`);
      var newText = document.createTextNode(`${r.data[i].rev_id}`);
      from.appendChild(newText2);
      let text = row.insertCell(0);
      text.appendChild(newText);
      let check = document.createElement("a");
      check.className = "accept_c";
      
      check = row.insertCell(2);
      check.innerHTML = ` <i class="fa fa-check" style="cursor: pointer;" >
                           
        </i>`;

      check.id = `${r.data[i].rev_id}_${r.data[i].ser_id}`;
      check.className = "check";
    }
  }

  //   acceptComment(btnId){
  //     let response = await fetch(`http://127.0.0.1:8000/unaccepted`);
  //     let r = await response.json();
  //     let t = btnId.split('_')
  //     let rid = t[0]
  //     let sid = t[1]
  //     console.log(rid , sid)
  //   }
}
