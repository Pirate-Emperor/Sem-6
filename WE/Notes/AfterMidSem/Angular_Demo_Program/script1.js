var myapp = angular.module("mymodule",[]);

myapp.controller("con1", function($scope){

    var message = "Inroduction to Angular JS....";
    $scope.message = message;
});

myapp.controller("imgcon", function($scope){
    $scope.imgdata={
        name:"Nexon",
        company:"Tata",
        year: 2023,
        picfile:"car1.jpg"
    };

});

myapp.controller("eventdemo", function($scope){
    $scope.technologies=[
        {name:"C", like: 0,dislike:0},
        {name:"C++", like: 0,dislike:0},
        {name:"Java", like: 0,dislike:0},
        {name:"Angular JS", like: 0,dislike:0},
        {name:"Python", like: 0,dislike:0},
    ];
$scope.iclick = function(t){
    t.like++;
};

$scope.dclick = function(t){
    t.dislike++;
};

});
myapp.controller("todo", function($scope){
    $scope.todolist=[{task:"Project", done:true},
    {task:"Practical Assg.", done:false}];

    $scope.addtask =function(){
        //alert($scope.ntask);
        $scope.todolist.push({task:$scope.ntask,done:false});
    };

    $scope.left = function(){
    //    alert("hello..");
        $scope.count=0;
        angular.forEach($scope.todolist, function(t){
       //     alert(t.done);
            $scope.count+= t.done ? 0:1;
        });
        return $scope.count;
    };
});


myapp.controller("checkdemo", function($scope){
    $scope.check=true;

    $scope.product =function(){
        $scope.res = $scope.num1*$scope.num2;
       
    };
   
});


myapp.controller("filterdemo", function($scope){
    $scope.message="Hello";
     $scope.employees = [
         {name:"Sara", dob:new Date("December 11,1987"),
         gender:"FEMALE",salary:8989.89},
        {name:"David", dob:new Date("March 11,1998"),gender:"MALE",salary:5454544.5454},
        {name:"ABC", dob:new Date("April 30,1989"),gender:"male",salary:4359.54},
        {name:"DEF", dob:new Date("May 8,2000"),gender:"female",salary:8483843.90392},
        {name:"John", dob:new Date("June 4,1988"),gender:"male",salary:4343.8933}

     ];
     $scope.rowlimit=3;
     $scope.sortcol=name;
});

myapp.controller("factorydemo", function($scope, stringservice, mathservice){
    $scope.callstr = function(){
        alert("hi...");
        $scope.outputstr = stringservice.processstr($scope.inputstr);
    };
    $scope.calllength =function(){
        $scope.strlength= stringservice.ulength($scope.inputstr);
    };
    $scope.callsquare = function(){
        $scope.outputval=mathservice.square($scope.val);
    }
});

myapp.controller("formcntrl", function($scope){
    $scope.master={};
    

    $scope.reset = function(){
        alert("hi..");
        $scope.user = angular.copy($scope.master);
    };
    $scope.update = function(){
        $scope.master = angular.copy($scope.user);
    };

});