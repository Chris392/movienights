//Script for the movie-card & Up-Down Votes
document.addEventListener("turbolinks:load",(event)=>{
    const card = document.getElementsByClassName('moviecard__folder')
    const shortDescription = document.getElementsByClassName('moviecard__short_description')
    const extended = document.getElementsByClassName('moviecard__extended')
    const actors = document.getElementsByClassName('moviecard__actors')
    
    const upvote = document.getElementsByClassName('vote__upvote')
    const downvote = document.getElementsByClassName('vote__downvote')
    
    const upvoteNumber = document.getElementsByClassName('vote__number_upvotes')
    const downvoteNumber = document.getElementsByClassName('vote__number_downvotes')
    
    
    let state = "neutral";
    
    console.log(shortDescription)
    
    for (let i = 0; i < card.length; i++){
        let count = i;
        //Die Anzahl der Aktuellen Up- und Downvotes wird gespeichert
        let currentUpvotes = upvoteNumber[count].innerHTML
        let currentDownvotes = downvoteNumber[count].innerHTML
    
        card[count].addEventListener("click", () => {
    
            if(card[count].innerHTML === "AUSKLAPPEN"){
            
            shortDescription[count].classList.remove("moviecard__short_description--visible")
            shortDescription[count].classList.add("moviecard__short_description--invisible")
    
    
            extended[count].classList.remove("moviecard__extended--invisible")
            extended[count].classList.add("moviecard__extended--visible")
            
    
            actors[count].style.display = "block"
    
            card[count].innerHTML = "EINKLAPPEN"
    
            }else{
    
            shortDescription[count].classList.add("moviecard__short_description--visible")
            shortDescription[count].classList.remove("moviecard__short_description--invisible")
    
            extended[count].classList.add("moviecard__extended--invisible")
            extended[count].classList.remove("moviecard__extended--visible")
    
            card[count].innerHTML = "AUSKLAPPEN"
    
            actors[count].style.display = "none"
    
            }
        })
    }
})