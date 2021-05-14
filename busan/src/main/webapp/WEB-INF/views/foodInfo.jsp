<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="InfoHeader.jsp" %>

<title>FOODINFO</title>

</head>
<body>

	<div class="wrap">
		<div class="wrap-in">
			<div class="wrap-in subWrap">
				<main id="contents">
					<!-- 타이틀,좋아요 -->
					<div class="conHeader">
						<div class="heart">
							<a href="#" id="like_btn"> 
								<img id="heart" src="${cpath }/img/heart.png">
								<span>좋아요</span>
							</a>
						</div>
						<h3 class="title">${addr } - ${dto.fname }</h3>
					</div>
					<!-- 사진이랑 설명란 -->
					<div class="detailWrap">
						<div class="detailWrap-in">
							<div class="detailImg">
								<div>
									<img src="${cpath }/uploadFile/food/${dto.fpic}">
								</div>
							</div>
							<div class="detailInfo">
								<dl>
									<dt>
										<span>주소</span>
									</dt>
									<dd>
										<span>${dto.faddr }</span>
									</dd>
								</dl>
								<dl>
									<dt>
										<span>전화번호</span>
									</dt>
									<dd>
										<span>${dto.fpnum1 }-${dto.fpnum2 }-${dto.fpnum3 }</span>
									</dd>
								</dl>
								<dl>
									<dt>
										<span>운영시간</span>
									</dt>
									<dd>
										<span>${dto.fopen } ~ ${dto.fclose }</span>
									</dd>
								</dl>
								<dl>
									<dt>
										<span>브레이크타임</span>
									</dt>
									<dd>
										<span>${dto.fbreaktime }</span>
									</dd>
								</dl>
								<dl>
									<dt>
										<span>대표메뉴</span>
									</dt>
									<dd>
										<span>${menu1 }, ${menu2 }</span>
									</dd>
								</dl>
								<dl>
									<dt>
										<span>휴무일</span>
									</dt>
									<dd>
										<span> <c:if test="${empty dto.fholiday }">
                                        		연중무휴
                                        	</c:if> ${dto.fholiday }
										</span>
									</dd>
								</dl>
							</div>
						</div>
					</div>
					<!-- 두번째 섹션 -->
					<div class="second-Wrap">
						<div class="second-Wrap-in">
							<div class="mapApi">
								<div class="map">
								</div>
							</div>

							<!--  그래프  -->
							<div class="statement">
								<div class="statement-div">
									<div class="statement-div-div">연령별 / 성별 검색인기도</div>
									<div class="state-middle">
										<div class="sm-left">
											<div class="sml-top" id="sml-top">
											<!-- 
												<div class="teneo">
													<div class="teneo-per"></div>
												</div>
												<div class="tweeo">
													<div class="tweeo-per"></div>
												</div>
												<div class="thieo">
													<div class="thieo-per"></div>
												</div>
												<div class="foueo">
													<div class="foueo-per"></div>
												</div>
												<div class="fifeo">
													<div class="fifeo-per"></div>
												</div>
												 -->
											</div>
											<div class="sml-bot">
												<div class="sml-bot-age1">10대</div>
												<div class="sml-bot-age2">20대</div>
												<div class="sml-bot-age3">30대</div>
												<div class="sml-bot-age4">40대</div>
												<div class="sml-bot-age5">50대</div>
											</div>
										</div>
										<div class="sm-right" id="sm-right">
											<!-- 
											<div class="sm-right-div">
												<div class="sm-gender">남성</div>
												<div class="sm-gdiv">
													<div class="gender-man-text"></div>
												</div>
												<div class="sm-gender">여성</div>
												<div class="sm-gdiv">
													<div class="gender-wom-text"></div>
												</div>
											</div>
											 -->
										</div>
									</div>
								</div>
							</div>
							<!-- 리뷰 -->
							<div class="review">
								<div class="review-div">
									<div class="review-div-div">
										<c:forEach var="review" items="${reviewList}">
											<div class="review-text">
												<div style="display: flex;">
													<div
														style="width: 150px; font-size: 11pt; margin-top: 3px;">
														${review.name }</div>
													<div style="color: #999; font-size: 10pt; margin-top: 7px;">
														<fmt:formatDate value="${review.reviewDate}"
															pattern="yyyy.MM.dd HH:mm" />
													</div>

												</div>
												<div
													style="padding: 0 5px 0 5px; border-bottom: 1px solid #ecf0f1; height: 30px">
													${review.content }</div>
											</div>
										</c:forEach>
									</div>
									<form id="insertReview" method="POST">
										<input type="hidden" name="cftName" value="${dto.fname }">
										<input type="hidden" name="name" value="${login.id }">
										<div style="display: flex;">
											<textarea name="content" cols="20" rows="4"
												class="review-insert" placeholder="댓글을 작성하려면 로그인 해주세요"></textarea>
											<button class="reviewBtn">등록</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</main>
			</div>
		</div>
	</div>

	<!-- 푸터 -->
	<footer id="footer">
		<div class="footer-inner">
			<div class="footer-logo">
				<img src="${cpath }/img/footer_logo.png">
			</div>
			<div class="footer-copyright">
				<div class="footer-minwon">
					<p class="tit">부산시 120 콜센터 (지역번호 051)</p>
					<p class="txt">
						평일 08:30 ~ 18:30 <br> 야간․공휴일 당직실 전환
					</p>
				</div>
				<div class="footer-address">
					<p>(우 47545) 부산광역시 연제구 중앙대로 1001(연산동)</p>
					<div class="link">
						<a href="https://www.busan.go.kr/bhintro02" target="_blank"
							title="새창열기">시청 찾아오시는길</a> <a
							href="https://www.busan.go.kr/bhintro03" target="_blank"
							title="새창열기">주차안내</a> <a href="https://www.busan.go.kr/opgude"
							target="_blank" title="새창열기">이용안내</a>
					</div>
					<p>본 홈페이지에 게시된 이메일 주소가 자동 수집되는 것을 거부하며,</p>
					<p>이를 위반시 개인정보 보호법에 의해 처벌됨을 유념하시기 바랍니다.</p>
					<p class="copy">Copyright © Busan Metropolitan City. All rights
						reserved.</p>
				</div>
			</div>
			<div class="footer-menu">
				<ul>
					<li><a href="https://www.busan.go.kr/terms" target="_blank"
						title="새창열기">약관</a></li>
					<li><a href="https://www.busan.go.kr/cright" target="_blank"
						title="새창열기">홈페이지 저작권 보호정책</a></li>
					<li><a href="https://www.busan.go.kr/vprivacy1"
						target="_blank" title="새창열기"> <span>개인정보 처리방침</span>
					</a></li>
					<li><a href="https://www.busan.go.kr/minwon/mdidsms"
						target="_blank" title="새창열기">행정서비스헌장</a></li>
					<li><a href="https://www.busan.go.kr/viewdn" target="_blank"
						title="새창열기">뷰어다운로드</a></li>
					<li><a href="https://www.busan.go.kr/minwon/homemonitor01"
						target="_blank" title="새창열기">홈페이지 모니터</a></li>
				</ul>
			</div>
		</div>
	</footer>

	<!-- 좋아요 버튼 -->
	<script type="text/javascript">
	const allcount = function() {
        
		 const smright = document.getElementById('sm-right');
 	     smright.innerHTML = '';
       var sql = '${dto.fname}';
       const url = '${cpath}/allcount/' + sql;
       const opt = {
          method: 'GET',
       }
       fetch(url,opt)
       .then(resp => resp.text())
       .then(text=>{
       	console.log('text : ' + text);
         // var cnt = Math.round(text);
         // console.log("cnt : " + cnt);
         var womanCnt = text.split(',')[0];
         var manCnt = text.split(',')[1];
         
         var wc = parseInt(womanCnt);
         var mc = parseInt(manCnt);
         
         var all = wc + mc;
         console.log('all : ' + all);
         
         var wcnt = Math.round(wc/all * 100);
         var mcnt = Math.round(mc/all * 100);
         
         
         console.log('textasdad : ' + wcnt);
         console.log('textq11111 : ' + mcnt);
          if(womanCnt==0 && manCnt==0){
       	   
             const smrightdiv = document.createElement('div');
             smrightdiv.className = 'sm-right-div';
             const smgender1 = document.createElement('div');
             smgender1.className = 'sm-gender';
             smgender1.innerText = '남성';
             const smgdiv1 = document.createElement('div');
             smgdiv1.className = 'sm-gdiv';
             const genderman = document.createElement('div');
             genderman.className = 'gender-man-text';
             genderman.innerText = '0%';
             smgdiv1.appendChild(genderman);
             
             
             const smgender2 = document.createElement('div');
             smgender2.className = 'sm-gender';
             smgender2.innerText = '여성';
             const smgdiv2 = document.createElement('div');
             smgdiv2.className = 'sm-gdiv';
             const genderwom = document.createElement('div');
             genderwom.className = 'gender-wom-text';
             genderwom.innerText = '0%';
             smgdiv2.appendChild(genderwom);
             
             smrightdiv.appendChild(smgender1);
             smrightdiv.appendChild(smgdiv1);
             smrightdiv.appendChild(smgender2);
             smrightdiv.appendChild(smgdiv2);
             
             smright.appendChild(smrightdiv);
             
             
             
            
          }
          else if(womanCnt==0 && manCnt !=0) {
       	   
          	const smrightdiv = document.createElement('div');
              smrightdiv.className = 'sm-right-div';
              const smgender1 = document.createElement('div');
              smgender1.className = 'sm-gender';
              smgender1.innerText = '남성';
              const smgdiv1 = document.createElement('div');
              smgdiv1.className = 'sm-gdiv';
              const genderman = document.createElement('div');
              genderman.className = 'gender-man-text';
              genderman.innerText = '100%';
              
              smgdiv1.appendChild(genderman);
              
              
              const smgender2 = document.createElement('div');
              smgender2.className = 'sm-gender';
              smgender2.innerText = '여성';
              const smgdiv2 = document.createElement('div');
              smgdiv2.className = 'sm-gdiv';
              const genderwom = document.createElement('div');
              genderwom.className = 'gender-wom-text';
              genderwom.innerText = '0%';
              smgdiv2.appendChild(genderwom);
              
              smrightdiv.appendChild(smgender1);
              smrightdiv.appendChild(smgdiv1);
              smrightdiv.appendChild(smgender2);
              smrightdiv.appendChild(smgdiv2);
              
              smright.appendChild(smrightdiv);
          	
          	
          
          }else if(womanCnt!=0 && manCnt==0){
       	   const smrightdiv = document.createElement('div');
              smrightdiv.className = 'sm-right-div';
              const smgender1 = document.createElement('div');
              smgender1.className = 'sm-gender';
              smgender1.innerText = '남성';
              const smgdiv1 = document.createElement('div');
              smgdiv1.className = 'sm-gdiv';
              const genderman = document.createElement('div');
              genderman.className = 'gender-man-text';
              genderman.innerText = '0%';
              
              smgdiv1.appendChild(genderman);
              
              
              const smgender2 = document.createElement('div');
              smgender2.className = 'sm-gender';
              smgender2.innerText = '여성';
              const smgdiv2 = document.createElement('div');
              smgdiv2.className = 'sm-gdiv';
              const genderwom = document.createElement('div');
              genderwom.className = 'gender-wom-text';
              genderwom.innerText = '100%';
              smgdiv2.appendChild(genderwom);
              
              smrightdiv.appendChild(smgender1);
              smrightdiv.appendChild(smgdiv1);
              smrightdiv.appendChild(smgender2);
              smrightdiv.appendChild(smgdiv2);
              
              smright.appendChild(smrightdiv);
          }else if(womanCnt!=0 && manCnt !=0){
       	   const smrightdiv = document.createElement('div');
              smrightdiv.className = 'sm-right-div';
              const smgender1 = document.createElement('div');
              smgender1.className = 'sm-gender';
              smgender1.innerText = '남성';
              const smgdiv1 = document.createElement('div');
              smgdiv1.className = 'sm-gdiv';
              const genderman = document.createElement('div');
              genderman.className = 'gender-man-text';
              genderman.innerText = mcnt + '%';
              
              smgdiv1.appendChild(genderman);
              
              
              const smgender2 = document.createElement('div');
              smgender2.className = 'sm-gender';
              smgender2.innerText = '여성';
              const smgdiv2 = document.createElement('div');
              smgdiv2.className = 'sm-gdiv';
              const genderwom = document.createElement('div');
              genderwom.className = 'gender-wom-text';
              genderwom.innerText = wcnt + '%';
              smgdiv2.appendChild(genderwom);
              
              smrightdiv.appendChild(smgender1);
              smrightdiv.appendChild(smgdiv1);
              smrightdiv.appendChild(smgender2);
              smrightdiv.appendChild(smgdiv2);
              
              smright.appendChild(smrightdiv);
          }
         // var womtext = document.querySelector('.gender-wom-text');
          
         // womtext.innerText = cnt + '%';
       });
    }
   
		let like = document.getElementById("like_btn");
		let img = document.getElementById("heart");
		
		
		let calllike;
		like.onclick = function() { //changeHeart(); 
			
			const smright = document.getElementById('sm-right');
	        smright.innerHTML = '';
	        const smltop = document.getElementById('sml-top');
	    	smltop.innerHTML = '';
		
		var sql = '${dto.fname}' + ',' + '${login.id}';
			console.log('sql : ' + sql);
			
			if('${login}' == '') {
				alert('로그인을 하세요~');
				location.href='${cpath}/login';
			}
			else {
				const updateheart  = async function(){
					console.log("${dto.fname}");
					const url = '${cpath}/heart/' + sql;
					const opt = {
							method: 'GET',
					}
					fetch(url,opt)
					.then(
							calllike = await function(){
							const url = '${cpath}/heartnumber/' + sql;
							const opt = {
									method: 'GET',
							}
							fetch(url,opt)
							.then(resp => resp.text())
							.then(text=>{
								var jh = Number(text);
								console.log('textInt : ' + jh);
								if(jh % 2 != 0) {
									img.src = "${cpath}/img/fullheart.png";
									allcount();
			                        agePercent();
								}
								else {
									img.src = "${cpath}/img/heart.png";
									allcount();
			                        agePercent();
								}
							});
						}		
					);
				}
				updateheart();
			}
		}
		
		if('${login}' !== '') {
			const like1 = function(){
				var sql = '${dto.fname}' + ',' + '${login.id}';
				console.log('sqlLike : ' + sql);
				
				
					console.log("${dto.fname}");
					const url = '${cpath}/heartnumber/' + sql;
					const opt = {
							method: 'GET',
					}
					fetch(url,opt)
					.then(resp => resp.text())
					.then(text=>{
						var jh = Number(text);
						console.log('textInt : ' + jh);
						if(jh % 2 != 0) {
							img.src = "${cpath}/img/fullheart.png";
							allcount();
	                        agePercent();
						}
						else {
							img.src = "${cpath}/img/heart.png";
							allcount();
	                        agePercent();
						}
					});
				}
				like1();
		}
	
	</script>

	<!-- 그래프 -->
   <script type="text/javascript">
    // 남녀 비율
     
   // 10대,20대... 그래프 비율
      const agePercent = function(){
    	  const smltop = document.getElementById('sml-top');
    	  smltop.innerHTML = '';
         var allArr = [];
         var teen = [];
         var twen = [];
         var thir = [];
         var four = [];
         var fift = [];
         
         let plus = 0;
         let plus1 = 0;
         let plus2 = 0;
         let plus3 = 0;
         let plus4 = 0;
         let result = 0;
         
         var thisYear = new Date().getFullYear();
         //console.log('이번년도 : ' + thisYear);
      
         var sql = '${dto.fname}';
         const url = '${cpath}/ageper/' + sql;
         const opt = {
               method: 'GET',
               
         }
         fetch(url,opt)
         .then(resp=>resp.json())
         .then(json=>{
            //console.log('tqt : ' + json[0]['BIRTH'].substr(0,2));
            for(var i = 0; i < json.length; i++) {
               if(json[i]['BIRTH'].substr(0,2) > 50){
                  json[i]['BIRTH'] = '19' + json[i]['BIRTH'].substr(0,2);
               //   console.log('json변경값 1900: ' + json[i]['BIRTH']);
               }else{
                  json[i]['BIRTH'] = '20' + json[i]['BIRTH'].substr(0,2);
                  console.log('json변경값 2000: ' + json[i]['BIRTH']);
               }
               allArr[i] = json[i]['BIRTH'];
            }
            
            for(var i = 0; i < allArr.length; i++) {
               
               result = thisYear - allArr[i];
               console.log('result : ' + result);
               if(result < 20){
                  teen[plus] = allArr[i];
                  //console.log('어디로들어옴 10대 ?');
                  plus++;
                  //console.log('plust : ' + plus);
                  
               }else if(result==20 || result==21 || result==22 || result==23 || result==24 || result==25 || result==26 || result==27 || result==28 || result==29){
                  twen[plus1] = allArr[i];
                  //console.log('어디로들어옴 20대 ?');
                  //console.log('plus1 : ' + plus1);
                  plus1++;
               }else if(result==30 || result==31 || result==32 || result==33 || result==34 || result==35 || result==36 || result==37 || result==38 || result==39){
                  thir[plus2] = allArr[i];
               //   console.log('어디로들어옴 30대 ?');
                  plus2++;
               }else if(40 <= result < 50){
                  four[plus3] = allArr[i];
                  //console.log('어디로들어옴 40대 ?');
                  plus3++;
               }else if(result > 49){
                  fift[plus4] = allArr[i];
               //   console.log('어디로들어옴 50대 ?');
                  plus4++;
               }
               
            }
            
var allSum = json.length;
            
            const teneo = document.createElement('div');
            teneo.className = 'teneo';
            const teneoper = document.createElement('div');
            teneoper.className = 'teneo-per';
            teneoper.style.height = 100- (((plus)/allSum)*100) + '%';
            teneoper.style.backgroundColor = '#ffffff';
            teneo.appendChild(teneoper);
            
            const tweeo = document.createElement('div');
            tweeo.className = 'tweeo';
            const tweeoper = document.createElement('div');
            tweeoper.className = 'tweeo-per';
            tweeoper.style.height = 100- (((plus1)/allSum)*100) + '%';
            tweeoper.style.backgroundColor = '#ffffff';
            tweeo.appendChild(tweeoper);
            
            const thieo = document.createElement('div');
            thieo.className = 'thieo';
            const thieoper = document.createElement('div');
            thieoper.className = 'thieo-per';
            thieoper.style.height = 100- (((plus2)/allSum)*100) + '%';
            thieoper.style.backgroundColor = '#ffffff';
            thieo.appendChild(thieoper);
            
            const foueo = document.createElement('div');
            foueo.className = 'foueo';
            const foueoper = document.createElement('div');
            foueoper.className = 'foueo-per';
            foueoper.style.height = 100- (((plus3)/allSum)*100) + '%';
            foueoper.style.backgroundColor = '#ffffff';
            foueo.appendChild(foueoper);
            
            const fifeo = document.createElement('div');
            fifeo.className = 'fifeo';
            const fifeoper = document.createElement('div');
            fifeoper.className = 'fifeo-per';
            fifeoper.style.height = 100- (((plus4)/allSum)*100) + '%';
            fifeoper.style.backgroundColor = '#ffffff';
            fifeo.appendChild(fifeoper);
            
            smltop.appendChild(teneo);
            smltop.appendChild(tweeo);
            smltop.appendChild(thieo);
            smltop.appendChild(foueo);
            smltop.appendChild(fifeo);
            
         });
      }
      
   </script>
	

	<!-- 리뷰 -->
	<script type="text/javascript">
      const reviewBtn = document.querySelector('.reviewBtn');
      const userid = '${login.id}';
      const form = document.getElementById('insertReview');
      const content = document.querySelector('textarea[name="content"]');
      
      const word = ["시발","씨발","좆","ㅅㅂ","ㅆㅂ","개새끼","개같은새끼","존나","좆나"];
      
      // 리뷰등록 ajax
      reviewBtn.onclick = function(event){
         event.preventDefault();
         
         // 욕 검사
         if(content.value != ''){
            for(let i = 0 ; i<word.length; i++){
               if(content.value.includes(word[i])){
                  alert('바른말 고운말을 사용합시다');
                  return;
               }
            }
         }
         if(userid == ''){
            alert('로그인이 필요한 서비스입니다');
            location.href = '${cpath}/login';
         }
         else if(content.value == '' && userid != ''){
            alert('내용을 입력하세요');
         }
         else{
            const formData = new FormData(form);
            const ob = {};
            
            for(const [key,value] of formData.entries()){
               ob[key] = value;
            }
            
            const json = JSON.stringify(ob);
            const url = '${cpath}/review';
            const opt = {
                  method : 'POST',
                  body : json,
                  headers : {
                     'Content-Type' : 'application/json'
                  }
            }
            
            fetch(url, opt)
            .then(resp => resp.text())
            .then(text => {
               if(text == 1){
                  alert('댓글이 등록되었습니다');
                  content.value = '';
                  location.href = '${cpath}/foodInfo/${dto.fname}/';
               }
            })
         }
      }
   </script>
   
   <!-- 지도 API -->
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=642811871765a9a66658d5a108cbcf71&libraries=services"></script>
   
   <script type="text/javascript">

   var mapContainer = document.querySelector('.map'); //지도를 담을 영역의 DOM 레퍼런스

   var mapOption = { //지도를 생성할 때 필요한 기본 옵션
      center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
      level: 3 //지도의 레벨(확대, 축소 정도)
   };

   var map = new kakao.maps.Map(mapContainer, mapOption); //지도 생성 및 객체 리턴
   
   // 주소-좌표 변환 객체를 생성합니다
   var geocoder = new kakao.maps.services.Geocoder();
   
   // 주소로 좌표를 검색합니다
   geocoder.addressSearch('${dto.faddr}', function(result, status) {
   
       // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {
   
           var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
   
           // 결과값으로 받은 위치를 마커로 표시합니다
           var marker = new kakao.maps.Marker({
               map: map,
               position: coords
           });
   
           // 인포윈도우로 장소에 대한 설명을 표시합니다
           var infowindow = new kakao.maps.InfoWindow({
               content: '<div style="width:150px;text-align:center;padding:6px 0;border-radius:50%;text-weight: bold;">'+'${dto.fname}'+'</div>'
           });
           infowindow.open(map, marker);
   
           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
           map.setCenter(coords);
       } 
        else{
           var back = '${cpath}/foodInfo/${dto.fname}/';
           alert('주소 확인 바람 !!');
           location.href = back;
        }
   });   
   
   </script>
   <script>
console.log('${cpath}');
   // 처음 이미지 기본값 default.jpg
   const file = document.getElementById('input_profile');      
   const uploadForm = document.getElementById('imgChange');
   const updateImgH = (event) =>{
      event.preventDefault();
      
      const sendImg = uploadForm;
      const formData = new FormData(sendImg);
      formData.append('file',event.target.files[0]);
      
      const url = '${cpath}' + '/upload/';
      const opt = {
            method: 'POST',
            body: formData
      };
      fetch(url,opt)
      .then(resp=> resp.text())
      .then(text=>{
         updateImgDB();
      });
   }
   file.onchange = updateImgH;
   let callImgName;
   
   const updateImgDB = async function(){
      const url = '${cpath}' + '/updateImg/' + '${login.id}';
      const opt = {
            method:'GET',
      }
      fetch(url,opt)
      .then(
         callImgName = await function(){
            const url = '${cpath}' + '/callImg/' + '${login.id}';
            const opt = {
                  method: 'GET',
            }
            fetch(url,opt)
            .then(resp => resp.text())
            .then(text=>{
              // console.log('불러온 text이름 : ' + text);
               var img = document.getElementById('backImg');
                  img.style.backgroundImage = "url('${cpath}/uploadImg/" + text + "'" ;
                  img.style.backgroundSize = "100% 100%";
            });
         
         });
      
   }
   
   // 처음 들어오자마자 이미지 띄워주는거 
   
   const firstCallImage = function(){
	   const url = '${cpath}' + '/firstCall/' + '${login.id}';
	   const opt ={
			   method:'GET',
	   }
	   fetch(url,opt)
	   .then(resp => resp.text())
	   .then(text=>{
		   var img = document.getElementById('backImg');
           img.style.backgroundImage = "url('${cpath}/uploadImg/" + text + "'" ;
           img.style.backgroundSize = "100% 100%";
	   });
   }
   if('${login.id}' != ''){
	   firstCallImage();
   }

</script>
<script type="text/javascript">
	if('${login.id}' == ''){
		allcount();
		agePercent();
	}
</script>

</body>
</html>