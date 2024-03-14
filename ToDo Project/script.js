//----------------Get current Location----------------//
//  var location=document.getElementById("Location")
//  location.innerhtml='';

//  function getlocation()
//  {
//      window.navigator.geolocation.getCurrentPosition(function(position){
//          console.log(position.coords.altitude)
//          console.log(position.coords.longitude)})
//  }

//------------------ENF OF CURRENT LOCATION---------------//


//------------------START OF DRAG AND DROP-----------------------//

var btn=document.getElementById("btn");
var inp=document.getElementById("inp");
var boxes=document.querySelectorAll(".box");
var deleteitem =document.getElementById("delete-btn");
 var drag=null;


 if(localStorage.getItem("todo") != null){
    todolist = JSON.parse(localStorage.getItem("todo"));
}

var todolist = [];







function additem()
{
    var todo=
    {
        itemname:inp.value
    }
    
    if(inp.value!=0)
    {
        boxes[0].innerHTML+=`
        <p class="item" draggable="true" >${inp.value}<p/>
        `
        inp.value='';
    }
    dragItem();
    console.log(todo);
    todolist.push(todo);
    console.log(todolist);
    
    localStorage.setItem("todo", JSON.stringify(todolist));
    
}

function deleteitem()
{
    localStorage.removeItem("todo");
}


function dragItem()
{
    
    var items = document.querySelectorAll('.item');
    items.forEach(item=>{
        item.addEventListener('dragstart',function(){
            drag=item;
             

        })
        item.addEventListener('dragend',function(){
            drag=null;
           

        })
        boxes.forEach(box=>{
            box.addEventListener('dragover',function(e){
                e.preventDefault();
                box.style.background='yellow'
                box.style.color='green'
            })
            box.addEventListener('dragleave',function(){
                box.style.background='green'
                box.style.color='yellow'
            })

            box.addEventListener('drop',function(){
                box.append(drag);
            })
        })
        
    })
  
}
