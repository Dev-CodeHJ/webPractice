<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 가입</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<style type="text/css">
		label {
		   width:160px;
		   display: inline-block;
		   float: left;
		}
		#button{
		   text-align: center;
		}
	</style>
</head>
<body>
<form name="reg_frm" id="reg_frm" action="JoinServlet">
   <label for="name"> 이름 </label><span style="color:red;"> * </span> 
   <input type="text" id="name" name="name"> <br>
  
   <label>주민등록번호  </label><span style="color:red;"> * </span>
   <input type="text" name="jumin_1"> - 
   <input type="text" name="jumin_2"> <br>
   
   <label for="id"> 아이디  </label><span style="color:red;"> * </span>
   <input type="text" id="id" name="id"><br>
    
    <label for="pwd"> 비밀번호 </label><span style="color:red;"> * </span> 
    <input type="password" id="pwd" name="pwd"><br>
    
    <label for="pwd_re"> 비밀번호 확인  </label><span style="color:red;"> * </span>
    <input type="password" id="pwd_re" name="pwd_re"><br>
    
    <label for="email">이메일 </label> &nbsp;
    <input type="text" name="email" > @ 
    <input type="text" name="email_dns" id="email_dns">
    <input type="hidden" name="hdEmail_dns" id="hdEmail_dns">
    <select name="emailaddr">
        <option value="" selected="selected">직접입력</option>
        <option value="daum.net">daum.net</option>
        <option value="empal.com">empal.com</option>
        <option value="gmail.com">gmail.com</option>
        <option value="hanmail.net">hanmail.net</option>
        <option value="msn.com">msn.com</option>
        <option value="naver.com">naver.com</option>
        <option value="nate.com" >nate.com</option>                
    </select><br>    
    
    <label for="zip">우편번호</label> &nbsp;
    <input type="text" id="zip" name="zip"><br>
           
    <label for="addr1">주소</label> &nbsp;
    <input type="text" id="addr1" name="addr1">
    <input type="text" name="addr2"><br>
    
    <label for="phone">핸드폰번호</label>  &nbsp;
    <input type="tel" id="phone" name="phone"><br>
    
    <label for="job">직업</label>  &nbsp;
    <select id="job" name="job" size="3">  
       <option value="학생">학생</option> 
       <option value="컴퓨터/인터넷">컴퓨터/인터넷</option> 
       <option value="언론">언론</option> 
       <option value="공무원" selected="selected">공무원</option> 
       <option value="군인">군인</option> 
       <option value="서비스업">서비스업</option> 
       <option value="교육">교육</option> 
    </select><br>
    
    <label for="chk_mail">메일/SMS 정보 수신</label>  &nbsp;
    <input type="radio" id="chk_mail" name="chk_mail" checked> 수신 
    <input type="radio" id="chk_mail" name="chk_mail"> 수신거부<br>

    <label for="interest">관심분야</label>  &nbsp;
      <input type="checkbox" id="interest" name="interest" value="생두"> 생두         
      <input type="checkbox" id="interest" name="interest" value="원두"> 원두         
      <input type="checkbox" id="interest" name="interest" value="로스팅"> 로스팅         
      <input type="checkbox" id="interest" name="interest" value="핸드드립"> 핸드드립         
      <input type="checkbox" id="interest" name="interest" value="에스프레소"> 에스프레소         
      <input type="checkbox" id="interest" name="interest" value="창업"> 창업<br><br>
    
 <div id="button">
    <input type="submit" value="회원가입" onclick="return check_ok()">
    <input type="reset" value="취소">
 </div>
</form>
<script type="text/javascript">
   $(document).ready(function(){
      
      $("select[name=emailaddr]").change(function(){
        if($(this).val().length == 0){
           $('#email_dns').attr('disabled',false);
           $('#email_dns').val('');
           $('#email_dns').focus();
        } else {
           let val1 = $("select[name=emailaddr] option:selected").text();
           $('#email_dns').val(val1);  
           $('#email_dns').attr('disabled',true);
        }
        
      });
      
   });
   

   function check_ok() {
      document.reg_frm.hdEmail_dns.value = document.reg_frm.email_dns.value;
      
      if (document.reg_frm.name.value.length == 0) {
         alert("이름을  써주세요.");
         reg_frm.name.focus();
         return false;
      }
      
      if (document.reg_frm.jumin_1.value.length != 6) {
         alert("주민번호 6글자이어야 합니다.");
         reg_frm.jumin_1.focus();
         return false;
      }
      
      if (document.reg_frm.jumin_2.value.length != 7) {
         alert("주민번호 7글자이어야 합니다.");
         reg_frm.jumin_2.focus();
         return false;         
      }
      
      if (document.reg_frm.id.value.length == 0) {
         alert("아이디를 써주세요");
         reg_frm.id.focus();
         return false;
      }
      
      if (document.reg_frm.id.value.length < 4) {
         alert("아이디는 4글자이상이어야 합니다.");
         reg_frm.id.focus();
         return false;
      }      

      if (document.reg_frm.pwd.value == "") {
         alert("패스워드는 반드시 입력해야 합니다.");
         reg_frm.pwd.focus();
         return false;
      }
      //비밀번호 확인결과가 같은지 체크 
      if (document.reg_frm.pwd.value != document.reg_frm.pwd_re.value) {
         alert("패스워드가 일치하지 않습니다.");
         reg_frm.pwd_re.focus();
         return false;
      }

      return true;
   }
</script>
</body>
</html>