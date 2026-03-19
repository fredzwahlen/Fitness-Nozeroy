let user = {}

function login(){

user.name = document.getElementById("name").value
user.classe = document.getElementById("classe").value

document.getElementById("login").style.display="none"
document.getElementById("app").style.display="block"

document.getElementById("welcome").textContent =
"Bienvenue " + user.name + " (" + user.classe + ")"

}

function generateWorkout(){

let exercices = [
"Squats",
"Pompes",
"Gainage",
"Jumping Jacks"
]

let workout = document.getElementById("workout")

workout.innerHTML="<h3>Séance</h3>"

exercices.forEach(ex=>{
workout.innerHTML += `<p>${ex}</p>`
})

}

function saveResult(exercice){

db.collection("results").add({
name:user.name,
classe:user.classe,
exercice:exercice,
date:new Date()
})

}

function loadStats(){

db.collection("results")
.where("name","==",user.name)
.get()
.then(snapshot=>{

let stats=document.getElementById("stats")

snapshot.forEach(doc=>{
stats.innerHTML += `<p>${doc.data().exercice}</p>`
})

})

}
