# First Steps Original

myFunction<-function(doorthing, doorthing2, x){  #I do not understand why you have a third arguement. maybe I'm missing something
  doorthing1<-doorthing2<-sample(1:3, 1) #This should name the size with 'size=1'. Also, doorthing1 should be called doorthing. Additionally, we should be taking in player inputs ratehr than generating them.
  if (doorthing1==doorthing2){ x<-TRUE } else { x==FALSE } #This is a mess to look at, also there should not be an equality logical in the else clause
  x
}
myFunction(sample(1:3, 1), sample(1:3, 1))
# Should return a TRUE if these samples are equal and
# a false if they are not


#First Steps edited
myFunction<-function(doorthing1, doorthing2){  
  x<-NULL  
  if (doorthing1==doorthing2){ x=TRUE } 
  else { x=FALSE }
  return(x)
}
myFunction(sample(1:3, size=1), sample(1:3, size=1))


#Problem Set #4

#Problem #1

setClass(Class="door",
         representation = representation(
           chosenDoor="numeric",
           carDoor="numeric",
            switch="logical"
         ),
         prototype = prototype(
           chosenDoor = c(),
           carDoor=c(),
           switch=c()
         )
)

setValidity("door", function(object){
  carWorks<-(object@carDoor==1 | object@carDoor==2 | object@carDoor==3)
  chosenWorks<-(object@chosenDoor==1|object@chosenDoor==2|object@chosenDoor==3)
  if(!carWorks | !chosenWorks){return("Pick numbers 1,2,3 for carDoor or chosenDoor")}  #This checks that doors are 1,2,or3)
})



setMethod("initialize", "door", function(.Object, ...){
  value = callNextMethod()
  validObject(value)
  return(value)
})


new("door",chosenDoor=4,carDoor=2,switch=FALSE)

setGeneric("PlayGame",
           function(object="door") {
             standardGeneric("door")
           })

setMethod("PlayGame", "door",
          function(object){
            return(object)
          } )





