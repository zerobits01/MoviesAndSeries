let uiUser = new UiUser()

uiUser.showSelectQ1()
uiUser.showSelectQ2()
uiUser.showSelectQ4();
uiUser.showSelectQ5();
uiUser.showSeriesBacon();

let submit_q1 = document.querySelector('#submit_q1')
let submit_q2 = document.querySelector('#submit_q2')
let submit_q3 = document.querySelector('#submit_q3')
let submit_q4 = document.querySelector('#submit_q4')
let submit_q6 = document.querySelector('#submit_q6')
let submit_bacon = document.querySelector('#submit_bacon')
let submit_comment = document.querySelector('#submit_comment')
 
submit_q1.addEventListener('click' , (e)=>{
    e.preventDefault();
    let genre =uiUser.genre_input_q1.value
    uiUser.showQ1_ser(genre)
    uiUser.showQ1_mov(genre)
      
})

submit_q2.addEventListener('click' , (e)=>{
    e.preventDefault();
    let str = uiUser.inputName_q2.value.split(" ")
    let fn = str[0]
    let ln = str[1]
    let year = uiUser.inputYear_q2.value
    
    uiUser.showQ2_ser(fn , ln , year)
    uiUser.showQ2_mov(fn , ln , year)
})

submit_q3.addEventListener('click' , (e)=>{
    e.preventDefault();
    uiUser.showQ3();
})

submit_q4.addEventListener('click' , (e)=>{
    e.preventDefault();
    let year = uiUser.inputYear_q4.value;
    uiUser.showQ4(year);
})


submit_q6.addEventListener('click' , (e)=>{
    e.preventDefault();
    uiUser.showQ6();
})

submit_bacon.addEventListener('click' , (e)=>{
    e.preventDefault();
    let actor = document.querySelector('#act_bacon').value.split(" ");
    let actorid = parseInt(actor[0])
    let number = parseInt(document.querySelector('#id_bacon').value);

   uiUser.calculate_bacon(actorid , number);
})

submit_comment.addEventListener('click' , (e)=>{
    e.preventDefault();
    let rev_username = document.querySelector('#username').value;
    let ser_name = document.querySelector('#choose_ser').value.split(' ');
    let ser_id =parseInt( ser_name[0]);
    let rate =parseInt( document.querySelector('#rate').value)
    let comment = document.querySelector('#comment').value
    uiUser.rateAndComment(rev_username,ser_id,rate,comment);
    document.querySelector('#username').value=''
    document.querySelector('#choose_ser').value=''
    document.querySelector('#comment').value=''
})







    
    




