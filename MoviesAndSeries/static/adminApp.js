let uiAdmin = new UiAdmin();

uiAdmin.showGenreToDelete();
uiAdmin.showUnacceptedComments();

let delete_genre = document.querySelector('#delete-genre')
let comments_table = document.querySelector('#comments_table')

uiAdmin.btnInsert.addEventListener('click' , (e) =>{
    e.preventDefault()
    let genre = uiAdmin.input_genre_to_insert.value;
    if(genre!=''){
        console.log(typeof genre) 
        uiAdmin.insertGenre(genre)
        alert("the genre inserted successfully:)");
    }
    else{
        alert("The genre can't be empty" )
    }
    
})
delete_genre.addEventListener('click' , (e) =>{
    e.preventDefault();
    let genre = document.querySelector('#select-genre-to-delete').value;
    uiAdmin.deleteGenre(genre);
    
})

comments_table.addEventListener('click' , (e)=>{
    //console.log(e.target.parentElement)
    if(e.target.parentElement.className == 'check'){
        
        let id = e.target.parentElement.id.split('_')
        let r_id = parseInt(id[0])
        let s_id = parseInt( id[1])

        let data = {
            sermov : 'S',
            revid : r_id,
            id : s_id
        };
        
       uiAdmin.post('http://127.0.0.1:8000/acception' , data)
       e.target.parentElement.parentElement.remove();



    }

    
})
   
