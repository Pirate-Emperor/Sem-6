myapp.factory("stringservice",function(){

        var processstr =function(input){
            var output="";
            alert("in function");
            if(!input)
                return input;
            for(i=0;i<input.length;i++){
                if(input[i] == input[i].toUpperCase())
                    output= output+ " ";
                output = output+input[i];
            }
            return output; 
        };

        var ulength= function(input){
            return input.length;
        }

        return{
            processstr:processstr,
            ulength:ulength
        };
});

myapp.factory("mathservice",function(){
    var square = function(inputval){
        return inputval*inputval;
    };

    return{
        square:square
    }
});