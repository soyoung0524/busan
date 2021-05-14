<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>JOIN</title>
<link rel="stylesheet" href="${cpath }/resources/css/join.css"></link>
</head>
<body style="width: 100%; height: 100%">
		<form method="POST" class="insertForm">
		<h2>회원가입</h2>
		<div class="insertId">
			<input type="text" id="id" class="inId" name="id" placeholder="아이디를 입력해주세요." minlength="5" maxlength="20" autofocus style="text-transform: lowercase;">
		</div>
        <div class="errorText hidden" style="width: 80%; height: 20px;margin-right: auto;margin-left: auto;margin-top: 0px;" >

        </div>
		<div class="insertPass">
			<input type="password" id="pw" class="inPw" name="pw" placeholder="비밀번호를 입력해주세요." required disabled>
        </div>
        <div class="errorText1 hidden" style="width: 80%; height: 20px;margin-right: auto;margin-left: auto;margin-top: 0px;">

        </div>
        <div class="insertName">
            <input type="text" id="na" class="inName" name="name" placeholder="이름을 입력해주세요." maxlength="4" disabled>
        </div>
        <div class="errorText2 hidden" style="width: 80%; height: 20px;margin-right: auto;margin-left: auto;margin-top: 0px;">

        </div>
        <div class="insertGender">
            <select class="inGender" name="gender" id="ge" disabled>
                <option value="남성" selected>남성</option>
                <option value="여성">여성</option>
            </select>
        </div>
        <div class="errorText3" style="width: 80%; height: 20px;margin-right: auto;margin-left: auto;margin-top: 0px;">

        </div>
        <div class="insertPnum">
            <input type="text" id="p1" class="inPnum1" name="pnum1" placeholder="010" maxlength="3" disabled>-
            <input type="text" id="p2" class="inPnum2" name="pnum2" placeholder="1111" maxlength="4" disabled>-
            <input type="text" id="p3" class="inPnum3" name="pnum3" placeholder="1111" maxlength="4" disabled>
        </div>
        <div class="errorText4 hidden" style="width: 80%; height: 20px;margin-right: auto;margin-left: auto;margin-top: 0px;">

        </div>	
        <div class="insertBirth">
            <input type="text" id="bir" class="inBirth" name="birth" placeholder="생년월일을 입력해주세요. (ex 920101)"  maxlength="6" disabled>
        </div>
        <div class="errorText5 hidden" style="width: 80%; height: 20px;margin-right: auto;margin-left: auto;margin-top: 0px;">

        </div>
        <div class="buttonDiv">
            
            <input type="submit" value="가입" class="insertNewBtn" id="insertNewBtn" disabled>
            <a class="historyBtn" href="javascript:window.history.back();">
            	뒤로가기
            </a>
        </div>
        <div class="errorText6" style="width: 80%; height: 20px;margin-right: auto;margin-left: auto;margin-top: 0px; color: red;font-size: 18px;text-align: left;font-weight: 600">
        	모두 입력하셔야 가입버튼이 활성화됩니다.
        </div>
	</form>
</body>
<script>
	
	// 5) 생년월일 체크
	const insertNewBtn = document.getElementById('insertNewBtn');
	const errorText6 = document.querySelector('.errorText6');
	document.getElementById('bir').onkeyup = function(e){
		var birValue = this.value;
		this.value = birValue.replace(/[^0-9]/gi,'');
		
		const errorText5 = document.querySelector('.errorText5');
		if(birValue.length != 6 && birValue != ''){
			errorText5.style.color = 'red';
			errorText5.innerText = '생년월일을 정확히 입력해주세요.';
			errorText5.classList.remove('hidden');
			errorText6.classList.remove('hidden');
			insertNewBtn.disabled = true;
		}else if(birValue.length == 6){
			errorText5.classList.add('hidden');
			errorText6.classList.add('hidden');
			insertNewBtn.disabled = false;
		}else if(birValue == 0){
			errorText5.classList.add('hidden');
			insertNewBtn.disabled = true;
		}
	}
	
	// 4-1) 첫번째 전화번호 체크
	const bir = document.getElementById('bir');
	const p2 = document.getElementById('p2');
	const p3 = document.getElementById('p3');
	document.getElementById('p1').onkeyup = function(e){
		var p1Value = this.value;
		this.value = p1Value.replace(/[^0-9]/gi,'');
		const errorText4 = document.querySelector('.errorText4');
		if(checkP1(p1Value) == false){
			errorText4.style.color = 'red';
			errorText4.innerText = '휴대폰 번호를 정확히 입력해주세요.';
			errorText4.classList.remove('hidden');
			p2.disabled = true;
			p3.disabled = true;
			bir.disabled = true;
			insertNewBtn.disabled = true;
		}else if(checkP1(p1Value) == true){
			errorText4.classList.add('hidden');
			p2.disabled = false;
			p3.disabled = false;
			bir.disabled = false;
		}
	}
	
	// 전화번호 (010,011,016,017,018,019)
	function checkP1(p1Value){
		var Parr = ['010','011','016','017','018','019'];
		
		for(var i=0;i<Parr.length;i++){
			
			
			if(p1Value == Parr[i]){
				
				return true;
			}
		}
		return false;
		
	}
	

	// 3) 이름 정규식 (한글만)
	document.getElementById('na').onkeyup = function(e){
		var naValue = this.value;
		this.value = naValue.replace(/[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi,'');
		const errorText2 = document.querySelector('.errorText2');
		if(naValue.length <2 && naValue != ''){
			errorText2.style.color = 'red';
			errorText2.innerText = '이름을 정확히 입력해주세요.';
			errorText2.classList.remove('hidden');
			const ge = document.getElementById('ge');
	        ge.disabled = true;
	        const p1 = document.getElementById('p1');
	        p1.disabled = true;
	        insertNewBtn.disabled = true;
		}else if(naValue.length >=2){
			errorText2.classList.add('hidden');
			const ge = document.getElementById('ge');
	        ge.disabled = false;
	        const p1 = document.getElementById('p1');
	        p1.disabled = false;
		}
		
	}


	// 2) 비밀번호 정규식
	document.getElementById('pw').onkeyup = function(e){
		var pwValue = this.value;
		this.value = pwValue.replace(/[^a-z0-9]/gi,'');
		const errorText1 = document.querySelector('.errorText1');
		if(pwValue.length < 8 && pwValue != ''){
			errorText1.style.color = 'red';
			errorText1.innerText = '8~16자의 영문, 숫자, 특수문자만 사용 가능합니다.';
	        errorText1.classList.remove('hidden');
	        const na = document.getElementById('na');
	        na.disabled = true;
	        insertNewBtn.disabled = true;
		}else if(pwValue.length >= 8){
            
        	const na = document.getElementById('na');
            errorText1.classList.remove('hidden');
          	errorText1.innerText = '사용가능한 비밀번호입니다.';
          	errorText1.style.color = 'blue';
          	na.disabled = false;
          	

        }else if(pwValue.length == 0){
      		errorText1.classList.add('hidden');
      		const na = document.getElementById('na');
	        na.disabled = true;
      	}
	}


    // 1) id 정규식 
    document.getElementById('id').onkeyup = function(e){
        var idValue = this.value;
        this.value = idValue.replace(/[^a-z0-9]/gi,'');
        const errorText = document.querySelector('.errorText');
        

        if(idValue.length <= 4 && idValue != ''){
            
        	
        	
        	errorText.style.color = 'red';
            errorText.innerText = '5~20자의 영문 소문자, 숫자만 사용 가능합니다';
            errorText.classList.remove('hidden');
            const pw = document.getElementById('pw');
			pw.disabled = true;
			insertNewBtn.disabled = true;
            
           
        }else if(idValue.length > 4){
            
        	    
            errorText.classList.add('hidden');
            idCheck(idValue);

        }else if(idValue.length == 0){
        	errorText.classList.add('hidden');
        	const pw = document.getElementById('pw');
			pw.disabled = true;
			insertNewBtn.disabled = true;
        }
    }
    
    const idCheck = function(idValue){
    	const url = '${cpath}/idCheck/' + idValue;
    	const opt = {
    			method: 'GET',
    			
    	}
    	fetch(url,opt)
    	.then(resp => resp.text())
    	.then(text=>{
    		console.log('text : '  + text);
    		if(text == ''){
    			const errorText = document.querySelector('.errorText');
    			 errorText.classList.remove('hidden');
    			 errorText.style.color = 'blue';
    			errorText.innerText = '사용가능한 아이디입니다.';
    			const pw = document.getElementById('pw');
    			pw.disabled = false;
    			
    		}else if(text == idValue){
    			const errorText = document.querySelector('.errorText');
    			 errorText.classList.remove('hidden');
    			 errorText.style.color = 'red';
    			errorText.innerText = '중복된 아이디입니다.';
    			
    		}
    	});
    }
    
</script>
</html>