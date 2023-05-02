// const btnClose = document.getElementById('btn-close-alert');

// btnClose.addEventListener('click',(e)=>{
//     let div = e.parentNode;
//     e.parentNode.removeChild(e);
// })

//Funcao para fechar uma mensagem alerta
function closeAlert(e){
    let div = e.parentNode;
    div.parentNode.removeChild(div);
}
