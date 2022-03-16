var user = document.querySelector('#user');
user.addEventListener('keyup', function(){
    var u_times = document.querySelector('.u_times');
    var u_check = document.querySelector('.u_check');
    if(user.value.length==0 || user.value.length<7){
        user.style.border = '1px solid red';
        u_times.style.display = 'block';
        u_times.style.display = 'none';
        return false;
    }
    else{
        user.style.border = '1px solid green';
        u_check.style.display = 'none';
        u_check.style.display = 'block';
    }
})

var pass = document.querySelector('#pass');
pass.addEventListener('keyup', function(){
    var p_times = document.querySelector('.p_times');
    var p_check = document.querySelector('.p_check');
    if(pass.value.length==0 || pass.value.length<8){
        pass.style.border = '1px solid red';
        p_times.style.display = 'block';
        p_times.style.display = 'none';
        return false;
    }
    else{
        pass.style.border = '1px solid green';
        p_check.style.display = 'none';
        p_check.style.display = 'block'; 
    }
})

function myfunctionSignup(){
    var name= document.getElementById("name").value;
    var email= document.getElementById("emailid").value;
    var phonenumber= document.getElementById("phonenumber").value;
    var pass= document.getElementById("pass").value;
    var cpwd= document.getElementById("re-pass").value;
    var pwd_expression= /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/;
    var letters= /^[A-Za-z]+$/
    var filter= /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    var number= /^[0-9][0-9]{9}$/;
    
    if(name==''){
        alert('The Field Name is empty, so please enter your name');
    }
    else if(!letters.test(name)){
        alert('Name field required only alphabet characters');
    }
    else if(email==''){
        alert('Please enter your user email id');
    }
    else if (!filter.test(email)){
        alert('Invalid email');
    }
    else if(phonenumber==''){
        alert('please enter your number');
    }
    else if(!number.test(phonenumber)){
        alert('phone number should have 10 digits');
    }
    else if(pass==''){
        alert('Please enter Password');
    }
    else if(cpwd==''){
        alert('Enter Confirm Password');
    }
    else if(!pwd_expression.test(cpwd)){
        alert ('Upper case, Lower case, Special character and Numeric letter are required in Password filed');
    }
    else if(pass != cpwd){
        alert ('Password not Matched');
    }
    else if(document.getElementById("re-pass").value.length <= 4){
        alert ('Password minimum length is 4');
    }
    else if(document.getElementById("re-pass").value.length >= 11){
        alert ('Password max length is 11');
    }
    else if(phonenumber==''){
        alert('Enter Phone number');
    }
    else if(!number.test(phonenumber)){
        alert('Phone Number should have 10 digits number')
    }
    else{
        alert('Successfully Created an Account');
        window.location.href="welcome.jsp";
    }
    
    
}

function myfunction(){
    var username=document.getElementById("name").value;
    var password=document.getElementById("pwd").value;
    var letters=/^[A-Za-z]+$/;
    if(username==''){
        alert('please enter username');
    }
    else if(password==''){
        alert('please enter password');
    }
    else if(!letters.test(username)){
        alert('Enter valid username');
    }
    else if(password.length<=4 || password.length>=11){
        alert("password length should be 4 to 11");
    }
}