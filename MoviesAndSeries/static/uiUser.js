// var aj = require("jquery");

class UiUser {
  constructor() {
    this.genre_input_q1 = document.querySelector("#genre_input_q1");
    this.q1_ser = document.querySelector("#q1_ser");
    this.q1_mov = document.querySelector("#q1_mov");
    this.films_q1 = document.querySelector("#films_q1");
    this.series_q1 = document.querySelector("#series_q1");
    this.films_title_q1 = document.querySelector("#films_title_q1");
    this.series_title_q1 = document.querySelector("#series_title_q1");

    this.films_title_q2 = document.querySelector("#films_title_q2");
    this.series_title_q2 = document.querySelector("#series_title_q2");
    this.inputName_q2 = document.querySelector("#inputName_q2");
    this.inputYear_q2 = document.querySelector("#inputYear_q2");
    this.q2_ser = document.querySelector("#q2_ser");
    this.q2_mov = document.querySelector("#q2_mov");
    this.films_q2 = document.querySelector("#films_q2");
    this.series_q2 = document.querySelector("#series_q2");

    this.q3 = document.querySelector("#q3");
    this.cnt_q3 = document.querySelector("#cnt_q3");

    this.inputYear_q4 = document.querySelector("#inputYear_q4");
    this.q4 = document.querySelector("#q4");
    this.cnt_q4 = document.querySelector("#cnt_q4");

    this.comment = document.querySelector("#comment");
    this.rate = document.querySelector("#rate");
    this.choose_ser = document.querySelector("#choose_ser");

    this.most_active = document.querySelector("#most_active");
    this.least_active = document.querySelector("#least_active");
    this.div_q6 = document.querySelector("#div_q6");
  }

  showMessage(msg , type , before_id){
    let div = document.createElement('div');
    div.className = `alert msg alert-${type}`;
    div.textContent = msg;
    this.container.insertBefore(div , before_id);
    setTimeout(() => {
        document.querySelector('.alert').remove();
    } , 3000)
 }

  async showSelectQ1() {
    let response = await fetch("http://127.0.0.1:8000/genres");
    let r = await response.json();

    for (let i = 0; i < r.length; i++) {
      var option = document.createElement("option");
      option.text = r[i].gen_title;
      this.genre_input_q1.add(option, i);
    }
  }
  async showSelectQ2() {
    let response = await fetch("http://127.0.0.1:8000/actors");
    let r = await response.json();

    for (let i = 0; i < r.length; i++) {
      var option = document.createElement("option");
      option.text = `${r[i].act_fname}  ${r[i].act_lname}`;
      this.inputName_q2.add(option, i);
    }

    let index = 0;

    for (let i = 1900; i < 2020; i++) {
      var option = document.createElement("option");
      option.text = i;
      this.inputYear_q2.add(option, index);
      index++;
    }
  }
  async showSelectQ5() {
    let response = await fetch("http://127.0.0.1:8000/series");
    let r = await response.json();
    for (let i = 0; i < r.length; i++) {
      var option = document.createElement("option");
      option.text = r[i].ser_id + " " + r[i].ser_title;
      this.choose_ser.add(option, i);
    }
  }

  async showQ1_mov(genre) {
    document.querySelector("#alert_q1_film").classList.add("invisible");
    let response = await fetch(`http://127.0.0.1:8000/genre/${genre}`);
    let r = await response.json();
    let count = this.q1_mov.rows.length;

    if (r.movies.length === 0) {
      document.querySelector("#alert_q1_film").classList.remove("invisible");
    }
    for (let i = 0; i < count; i++) {
      this.q1_mov.deleteRow(0);
    }
    if (r.movies.length != 0) {
      let tableBody = this.q1_mov.getElementsByTagName("tbody")[0];
      for (let i = 0; i < r.movies.length; i++) {
        let row = tableBody.insertRow(0);
        let cell = row.insertCell(0);
        var newText = document.createTextNode(`${r.movies[i].mov_title}`);
        cell.appendChild(newText);
      }
      this.films_q1.classList.remove("invisible");
    }
  }
  async showQ1_ser(genre) {
    document.querySelector("#alert_q1_ser").classList.add("invisible");
    let response = await fetch(`http://127.0.0.1:8000/genre/${genre}`);
    let r = await response.json();
    let count = this.q1_ser.rows.length;
    if (r.series.length === 0) {
      document.querySelector("#alert_q1_ser").classList.remove("invisible");
    }
    for (let i = 0; i < count; i++) {
      this.q1_ser.deleteRow(0);
    }
    if (r.series.length != 0) {
      let tableBody = this.q1_ser.getElementsByTagName("tbody")[0];
      for (let i = 0; i < r.series.length; i++) {
        let row = tableBody.insertRow(0);
        let cell = row.insertCell(0);
        var newText = document.createTextNode(`${r.series[i].ser_title}`);
        cell.appendChild(newText);
      }
      this.series_q1.classList.remove("invisible");
    }
  }
  async showQ2_mov(fname, lname, year) {
    document.querySelector("#alert_q2_film").classList.add("invisible");
    let response = await fetch(
      `http://127.0.0.1:8000/fname/${fname}/lname/${lname}/year/${year}`
    );
    let r = await response.json();
    let count = this.q2_mov.rows.length;
    for (let i = 0; i < count; i++) {
      this.q2_mov.deleteRow(0);
    }
    if (r.movies.length === 0) {
      document.querySelector("#alert_q2_film").classList.remove("invisible");
    } else {
      let tableBody = this.q2_mov.getElementsByTagName("tbody")[0];
      for (let i = 0; i < r.movies.length; i++) {
        let row = tableBody.insertRow(0);
        let cell = row.insertCell(0);
        var newText = document.createTextNode(`${r.movies[i].ser_title}`);
        cell.appendChild(newText);
      }
      this.films_q2.classList.remove("invisible");
    }
  }

  async showQ2_ser(fname, lname, year) {
    document.querySelector("#alert_q2_ser").classList.add("invisible");
    let response = await fetch(
      `http://127.0.0.1:8000/fname/${fname}/lname/${lname}/year/${year}`
    );
    let r = await response.json();
    let count = this.q2_ser.rows.length;
    for (let i = 0; i < count; i++) {
      this.q2_ser.deleteRow(0);
    }
    if (r.series.length === 0) {
      document.querySelector("#alert_q2_ser").classList.remove("invisible");
    } else {
      let tableBody = this.q2_ser.getElementsByTagName("tbody")[0];
      for (let i = 0; i < r.series.length; i++) {
        let row = tableBody.insertRow(0);
        let cell = row.insertCell(0);
        var newText = document.createTextNode(`${r.series[i].ser_title}`);
        cell.appendChild(newText);
      }
      this.series_q2.classList.remove("invisible");
    }
  }

  async showQ3() {
    let response = await fetch(`http://127.0.0.1:8000/twocommon`);
    let r = await response.json();
    let count = r.movies.length;
    let tablebody = this.q3.getElementsByTagName("tbody")[0];
    if (this.q3.rows.length == 0) {
      let row = tablebody.insertRow(0);
      for (let i = 0; i < count; i++) {
        let cell = row.insertCell(0);
        let mov_title = r.movies[i].mov_title;
        cell.innerHTML = mov_title;
      }
    }

    this.cnt_q3.classList.remove("invisible");
  }
  async showSelectQ4() {
    let index = 0;
    for (let i = 1900; i < 2020; i++) {
      var option = document.createElement("option");
      option.text = i;
      this.inputYear_q4.add(option, index);
      index++;
    }
  }
  async showQ4(year) {
    this.films_q2.classList.remove("invisible");
    let response = await fetch(`http://127.0.0.1:8000/samegenre/${year}`);
    let r = await response.json();
    let tableBody = this.q4.getElementsByTagName("tbody")[0];
    for (let i = 0; i < r.length; i++) {
      let row = tableBody.insertRow(0);
      let cell1 = row.insertCell(0);
      let cell2 = row.insertCell(1);
      let cell3 = row.insertCell(2);
      let cell4 = row.insertCell(3);
      let cell5 = row.insertCell(4);
      var act_fname = document.createTextNode(`${r.act_fname[i]}`);
      cell1.appendChild(act_fname);
      var act_lname = document.createTextNode(`${r.act_lname[i]}`);
      cell2.appendChild(act_lname);
      var mov_title = document.createTextNode(`${r.mov_title[i]} `);
      cell3.appendChild(mov_title);
      var ser_title = document.createTextNode(`${r.ser_title[i]} `);
      cell4.appendChild(ser_title);
      var gen_title = document.createTextNode(`${r.gen_title[i]}`);
      cell5.appendChild(gen_title);
    }
    if (r.length != 0) {
      this.cnt_q4.classList.remove("invisible");
    } else {
      document.querySelector("#alert_q4").classList.remove("invisible");
    }
  }

  async showQ6() {
    let response = await fetch("http://127.0.0.1:8000/findml");
    let r = await response.json();

    this.most_active.innerHTML = r.most_active;
    this.least_active.innerHTML = r.least_active;
    this.div_q6.classList.remove("invisible");
  }

  async showSeriesBacon() {
    let response = await fetch("http://127.0.0.1:8000/actors");
    let r = await response.json();
    for (let i = 0; i < r.length; i++) {
      var option = document.createElement("option");
      option.text = r[i].act_id + " " + r[i].act_fname + " " + r[i].act_lname;
      document.querySelector("#act_bacon").add(option, i);
    }
  }

  async calculate_bacon(act_id, number) {
    let response = await fetch(
      `http://127.0.0.1:8000/actid/${act_id}/bacon/${number}`
    );
    let r = await response.json();
    console.log(r);
  }

  post(url, data) {
    var xmlhttp = new XMLHttpRequest(); // new HttpRequest instance
    var theUrl = url;
   
    xmlhttp.open("POST", theUrl , true);
    
    xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xmlhttp.send(JSON.stringify(data));
    xmlhttp.onload = function () {
      if(xmlhttp.status==200){
        document.querySelector('#alert_sent').classList.remove('invisible')
        setTimeout(() => {
          document.querySelector('#alert_sent').classList.add('invisible');
      } , 3000)
      }
      else{
        document.querySelector('#alert_sent').classList.remove('alert-success')
        document.querySelector('#alert_sent').classList.add('alert-danger')
        document.querySelector('#alert_sent').classList.remove('invisible')
        setTimeout(() => {
          document.querySelector('#alert_sent').classList.add('invisible');
      } , 3000)
      }  
    }; 
  }

  rateAndComment(rev_username, ser_id, rate, comment) {
    let data = {
      rev_name: rev_username,
      id: ser_id,
      rate: rate,
      comment: comment
    };
    this.post("http://127.0.0.1:8000/rate", data)
    
  }
}
