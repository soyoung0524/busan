<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<title>CAFE</title>

<body>

	<div class="daddy">
	
		<div class="top-outline">
			<div class="first-d">
				<div class="inner-fd">
					<div class="top-text">분류</div>
				</div>
				<div class="inner-fd1">
					<div class="fd1-inline">
						<div class="btn1">
							<a href="${cpath }/cafe"><button id="btn1-1">카페</button></a>
						</div>
						<div class="btn2">
							<a href="${cpath }/food"><button id="btn2-1">음식점</button></a>
						</div>
						<div class="btn3">
							<a href="${cpath }/tour"><button id="btn3-1">관광</button></a>
						</div>
					</div>
				</div>
			</div>
			
			<script type="text/javascript">
				const btn11 = document.getElementById('btn1-1');
				btn11.style.backgroundColor = 'rgb(40, 158, 107)';
				btn11.style.color = '#ffffff';
				const btn21 = document.getElementById('btn2-1');
				btn21.style.backgroundColor = '#ffffff';
				btn21.style.color = 'rgb(70, 105, 167)';
			</script>
			
			<div class="second-d">
	
				<div class="sd-bottom no-drag">
					<div class="map-textdiv">
						<div class="map-text">부산지도</div>
					</div>
					<div class="map">
						<img src="img/check/busanmap.png" style="width: 800px; height: 350px;" id="mapsrc">
						<button id="gangseoBtn" name="1">강서구</button>
						<button id="geumjeongguBtn" name="2">금정구</button>
						<button id="gijangBtn" name="3">기장군</button>
						<button id="namguBtn" name="4">남구</button>
						<button id="dongguBtn" name="5">중구</button>
						<button id="dongraeBtn" name="6">동래구</button>
						<button id="jinguBtn" name="7">진구</button>
						<button id="bukguBtn" name="8">북구</button>
						<button id="sasangBtn" name="9">사상구</button>
						<button id="sahaBtn" name="10">사하구</button>
						<button id="seoguBtn" name="11">서구</button>
						<button id="suyeongBtn" name="12">수영구</button>
						<button id="yeonjeguBtn" name="13">연제구</button>
						<button id="yeongdoBtn" name="14">영도</button>
						<button id="jungguBtn" name="15">동구</button>
						<button id="haeundaeBtn" name="16">해운대구</button>
					</div>
				</div>
			</div>
		</div>
	
	
		
		<div class="dataList">
			<c:forEach var="dto" items="${list }">
				<div class="dataDiv">
					<div>
							<a href="${cpath }/cafeInfo/${dto.cname}/">
								<img src="${cpath }/uploadFile/cafe/${dto.cpic}">
							</a>
					</div>
					<div class="dataName">${dto.cname }</div>
					<div class="dataAddr">
						<c:set var="caddr" value="${fn:split(dto.caddr,' ') }"></c:set>
							<c:forEach var="addr" items="${caddr }" begin="0" end="1">
								${addr }
							</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
		
	</div>

</body>

<script type="text/javascript" src="${cpath }/resources/js/map.js"></script>

<script>

const cpath = '${cpath}';
const searchBtn = document.getElementById('searchBtn');
const dataList = document.querySelector('.dataList');
const map = document.querySelector('.map');
const list = map.querySelectorAll('button');

// 검색
const makeToList = function(json) {
      const div = document.createElement('div');
      div.classList.add('dataList');
      
      for(let i = 0; i < json.length; i++){
    	// console.log("fdfe : " + json[i].fname);
         const div1 = document.createElement('div');
         const a = document.createElement('a');
         const img = document.createElement('img');
         const div2 = document.createElement('div');
         const div3 = document.createElement('div');
         const div4 = document.createElement('div');
         
         a.appendChild(img);
         div2.appendChild(a);
         div1.appendChild(div2);
         div1.appendChild(div3);
         div1.appendChild(div4);
         
         div1.classList.add('dataDiv');
         div3.classList.add('dataName');
         div4.classList.add('dataAddr');
         
         div3.innerText = json[i].cname;
         div4.innerText = json[i].caddr.split(' ')[0];
         div4.innerText += ' '+ json[i].caddr.split(' ')[1];
         img.src = cpath + '/uploadFile/cafe/' + json[i].cpic;
         a.href = cpath + '/cafeInfo/' + json[i].cname + '/';
         div.appendChild(div1);
      }
      return div;
   }

// 검색 버튼누르면

searchBtn.onclick = function() {
	
	dataList.innerHTML = '';	// list 다 지우고
	let search = document.getElementById('search').value; // 검색한 text 불러오고
	
	console.log("search : " + search);
	
	const url = cpath + '/cafe/' + search;
	const opt = {
		method: 'GET',
	}
	fetch(url,opt)
	.then(resp => resp.json())
	.then(json => {
		console.log("json : " + json);
		dataList.appendChild(makeToList(json)); // json형태로 searchList에 어펜드차일드
	});
}

list.forEach(ele => {
    ele.onclick = (event) => {
       dataList.innerHTML = '';
       
       var gangseo = document.getElementById('gangseoBtn');
       var geumjeong = document.getElementById('geumjeongguBtn');
       var gijang = document.getElementById('gijangBtn');
       var namgu = document.getElementById('namguBtn');
       var donggu = document.getElementById('dongguBtn');
       var dongrae = document.getElementById('dongraeBtn');
       var jingu = document.getElementById('jinguBtn');
       var bukgu = document.getElementById('bukguBtn');
       var sasang = document.getElementById('sasangBtn');
       var saha = document.getElementById('sahaBtn');
       var seogu = document.getElementById('seoguBtn');
       var suyeong = document.getElementById('suyeongBtn');
       var yeonje = document.getElementById('yeonjeguBtn');
       var yeongdo = document.getElementById('yeongdoBtn');
       var junggu = document.getElementById('jungguBtn');
       var haeundae = document.getElementById('haeundaeBtn');
       var mapsrc = document.getElementById('mapsrc');
       var addr = ele.innerText;
       
       console.log('ㅎㅇㅎㅇ');
       
       var btn = event.target.id;
       var where = event.target.name;
       
       console.log(where);
       
     //  console.log('addr : ' + addr);
     //  console.log('이벤트타겟 : ' + event.target.name);
       const url = cpath + '/cafeAddr/' + addr +'/';
    //   console.log('url : ' + url);
       const opt = {
             method : 'GET',
       }
       fetch(url,opt)
       .then(resp => resp.json())
       .then(json => {
        //  console.log(json);
          dataList.appendChild(makeToList(json));
          
          
       })
     
       if(where == 1){
       	mapsrc.src = "img/check/gangseogu.png";
       	gangseo.style.border = 'none';
           gangseo.style.backgroundColor = 'rgb(211, 217, 234)';
           junggu.style.border = 'none';
           junggu.style.backgroundColor = '#ffffff';
           geumjeong.style.border = 'none';
           geumjeong.style.backgroundColor = '#ffffff';
           gijang.style.border = 'none';
           gijang.style.backgroundColor = '#ffffff';
           namgu.style.border = 'none';
           namgu.style.backgroundColor = '#ffffff';
           donggu.style.border = 'none';
           donggu.style.backgroundColor = '#ffffff';
           dongrae.style.border = 'none';
           dongrae.style.backgroundColor = '#ffffff';
           jingu.style.border = 'none';
           jingu.style.backgroundColor = '#ffffff';
           bukgu.style.border = 'none';
           bukgu.style.backgroundColor = '#ffffff';
           sasang.style.border = 'none';
           sasang.style.backgroundColor = '#ffffff';
           saha.style.border = 'none';
           saha.style.backgroundColor = '#ffffff';
           seogu.style.border = 'none';
           seogu.style.backgroundColor = '#ffffff';
           suyeong.style.border = 'none';
           suyeong.style.backgroundColor = '#ffffff';
           yeonje.style.border = 'none';
           yeonje.style.backgroundColor = '#ffffff';
           yeongdo.style.border = 'none';
           yeongdo.style.backgroundColor = '#ffffff';
           haeundae.style.border = 'none';
           haeundae.style.backgroundColor = '#ffffff';
       }else if(where == 2){
       	mapsrc.src = "img/check/geumjeonggu.png";
       	geumjeong.style.border = 'none';
           geumjeong.style.backgroundColor = 'rgb(211, 217, 234)';
   	    gangseo.style.border = 'none';
   	    gangseo.style.backgroundColor = '#ffffff';
   	    junggu.style.border = 'none';
   	    junggu.style.backgroundColor = '#ffffff';
   	    gijang.style.border = 'none';
   	    gijang.style.backgroundColor = '#ffffff';
   	    namgu.style.border = 'none';
   	    namgu.style.backgroundColor = '#ffffff';
   	    donggu.style.border = 'none';
   	    donggu.style.backgroundColor = '#ffffff';
   	    dongrae.style.border = 'none';
   	    dongrae.style.backgroundColor = '#ffffff';
   	    jingu.style.border = 'none';
   	    jingu.style.backgroundColor = '#ffffff';
   	    bukgu.style.border = 'none';
   	    bukgu.style.backgroundColor = '#ffffff';
   	    sasang.style.border = 'none';
   	    sasang.style.backgroundColor = '#ffffff';
   	    saha.style.border = 'none';
   	    saha.style.backgroundColor = '#ffffff';
   	    seogu.style.border = 'none';
   	    seogu.style.backgroundColor = '#ffffff';
   	    suyeong.style.border = 'none';
   	    suyeong.style.backgroundColor = '#ffffff';
   	    yeonje.style.border = 'none';
   	    yeonje.style.backgroundColor = '#ffffff';
   	    yeongdo.style.border = 'none';
   	    yeongdo.style.backgroundColor = '#ffffff';
   	    haeundae.style.border = 'none';
   	    haeundae.style.backgroundColor = '#ffffff';
       }else if(where == 3){
       	 gijang.style.border = 'none';
    	    gijang.style.backgroundColor = 'rgb(211, 217, 234)';
       	mapsrc.src = "img/check/gijanggun.png";
           gangseo.style.border = 'none';
           gangseo.style.backgroundColor = '#ffffff';
           geumjeong.style.border = 'none';
           geumjeong.style.backgroundColor = '#ffffff';
           junggu.style.border = 'none';
           junggu.style.backgroundColor = '#ffffff';
           namgu.style.border = 'none';
           namgu.style.backgroundColor = '#ffffff';
           donggu.style.border = 'none';
           donggu.style.backgroundColor = '#ffffff';
           dongrae.style.border = 'none';
           dongrae.style.backgroundColor = '#ffffff';
           jingu.style.border = 'none';
           jingu.style.backgroundColor = '#ffffff';
           bukgu.style.border = 'none';
           bukgu.style.backgroundColor = '#ffffff';
           sasang.style.border = 'none';
           sasang.style.backgroundColor = '#ffffff';
           saha.style.border = 'none';
           saha.style.backgroundColor = '#ffffff';
           seogu.style.border = 'none';
           seogu.style.backgroundColor = '#ffffff';
           suyeong.style.border = 'none';
           suyeong.style.backgroundColor = '#ffffff';
           yeonje.style.border = 'none';
           yeonje.style.backgroundColor = '#ffffff';
           yeongdo.style.border = 'none';
           yeongdo.style.backgroundColor = '#ffffff';
           haeundae.style.border = 'none';
           haeundae.style.backgroundColor = '#ffffff';
       }else if(where == 4){
       	 mapsrc.src = "img/check/namgu.png";
       	 namgu.style.border = 'none';
            namgu.style.backgroundColor = 'rgb(211, 217, 234)';
       	    gangseo.style.border = 'none';
       	    gangseo.style.backgroundColor = '#ffffff';
       	    geumjeong.style.border = 'none';
       	    geumjeong.style.backgroundColor = '#ffffff';
       	    gijang.style.border = 'none';
       	    gijang.style.backgroundColor = '#ffffff';
       	    junggu.style.border = 'none';
       	    junggu.style.backgroundColor = '#ffffff';
       	    donggu.style.border = 'none';
       	    donggu.style.backgroundColor = '#ffffff';
       	    dongrae.style.border = 'none';
       	    dongrae.style.backgroundColor = '#ffffff';
       	    jingu.style.border = 'none';
       	    jingu.style.backgroundColor = '#ffffff';
       	    bukgu.style.border = 'none';
       	    bukgu.style.backgroundColor = '#ffffff';
       	    sasang.style.border = 'none';
       	    sasang.style.backgroundColor = '#ffffff';
       	    saha.style.border = 'none';
       	    saha.style.backgroundColor = '#ffffff';
       	    seogu.style.border = 'none';
       	    seogu.style.backgroundColor = '#ffffff';
       	    suyeong.style.border = 'none';
       	    suyeong.style.backgroundColor = '#ffffff';
       	    yeonje.style.border = 'none';
       	    yeonje.style.backgroundColor = '#ffffff';
       	    yeongdo.style.border = 'none';
       	    yeongdo.style.backgroundColor = '#ffffff';
       	    haeundae.style.border = 'none';
       	    haeundae.style.backgroundColor = '#ffffff';
       }else if(where == 5){
       	mapsrc.src = "img/check/junggu.png";
       	 donggu.style.border = 'none';
    	    donggu.style.backgroundColor = 'rgb(211, 217, 234)';
           gangseo.style.border = 'none';
           gangseo.style.backgroundColor = '#ffffff';
           geumjeong.style.border = 'none';
           geumjeong.style.backgroundColor = '#ffffff';
           gijang.style.border = 'none';
           gijang.style.backgroundColor = '#ffffff';
           namgu.style.border = 'none';
           namgu.style.backgroundColor = '#ffffff';
           junggu.style.border = 'none';
           junggu.style.backgroundColor = '#ffffff';
           dongrae.style.border = 'none';
           dongrae.style.backgroundColor = '#ffffff';
           jingu.style.border = 'none';
           jingu.style.backgroundColor = '#ffffff';
           bukgu.style.border = 'none';
           bukgu.style.backgroundColor = '#ffffff';
           sasang.style.border = 'none';
           sasang.style.backgroundColor = '#ffffff';
           saha.style.border = 'none';
           saha.style.backgroundColor = '#ffffff';
           seogu.style.border = 'none';
           seogu.style.backgroundColor = '#ffffff';
           suyeong.style.border = 'none';
           suyeong.style.backgroundColor = '#ffffff';
           yeonje.style.border = 'none';
           yeonje.style.backgroundColor = '#ffffff';
           yeongdo.style.border = 'none';
           yeongdo.style.backgroundColor = '#ffffff';
           haeundae.style.border = 'none';
           haeundae.style.backgroundColor = '#ffffff';
       }else if(where == 7){
       	mapsrc.src = "img/check/jingu.png";
       	 jingu.style.border = 'none';
            jingu.style.backgroundColor = 'rgb(211, 217, 234)';
           gangseo.style.border = 'none';
           gangseo.style.backgroundColor = '#ffffff';
           geumjeong.style.border = 'none';
           geumjeong.style.backgroundColor = '#ffffff';
           gijang.style.border = 'none';
           gijang.style.backgroundColor = '#ffffff';
           namgu.style.border = 'none';
           namgu.style.backgroundColor = '#ffffff';
           donggu.style.border = 'none';
           donggu.style.backgroundColor = '#ffffff';
           dongrae.style.border = 'none';
           dongrae.style.backgroundColor = '#ffffff';
           junggu.style.border = 'none';
           junggu.style.backgroundColor = '#ffffff';
           bukgu.style.border = 'none';
           bukgu.style.backgroundColor = '#ffffff';
           sasang.style.border = 'none';
           sasang.style.backgroundColor = '#ffffff';
           saha.style.border = 'none';
           saha.style.backgroundColor = '#ffffff';
           seogu.style.border = 'none';
           seogu.style.backgroundColor = '#ffffff';
           suyeong.style.border = 'none';
           suyeong.style.backgroundColor = '#ffffff';
           yeonje.style.border = 'none';
           yeonje.style.backgroundColor = '#ffffff';
           yeongdo.style.border = 'none';
           yeongdo.style.backgroundColor = '#ffffff';
           haeundae.style.border = 'none';
           haeundae.style.backgroundColor = '#ffffff';
       }else if(where == 8){
       	 mapsrc.src = "img/check/bukgu.png";
       	 bukgu.style.border = 'none';
            bukgu.style.backgroundColor = 'rgb(211, 217, 234)';
       	    gangseo.style.border = 'none';
       	    gangseo.style.backgroundColor = '#ffffff';
       	    geumjeong.style.border = 'none';
       	    geumjeong.style.backgroundColor = '#ffffff';
       	    gijang.style.border = 'none';
       	    gijang.style.backgroundColor = '#ffffff';
       	    namgu.style.border = 'none';
       	    namgu.style.backgroundColor = '#ffffff';
       	    donggu.style.border = 'none';
       	    donggu.style.backgroundColor = '#ffffff';
       	    dongrae.style.border = 'none';
       	    dongrae.style.backgroundColor = '#ffffff';
       	    jingu.style.border = 'none';
       	    jingu.style.backgroundColor = '#ffffff';
       	    junggu.style.border = 'none';
       	    junggu.style.backgroundColor = '#ffffff';
       	    sasang.style.border = 'none';
       	    sasang.style.backgroundColor = '#ffffff';
       	    saha.style.border = 'none';
       	    saha.style.backgroundColor = '#ffffff';
       	    seogu.style.border = 'none';
       	    seogu.style.backgroundColor = '#ffffff';
       	    suyeong.style.border = 'none';
       	    suyeong.style.backgroundColor = '#ffffff';
       	    yeonje.style.border = 'none';
       	    yeonje.style.backgroundColor = '#ffffff';
       	    yeongdo.style.border = 'none';
       	    yeongdo.style.backgroundColor = '#ffffff';
       	    haeundae.style.border = 'none';
       	    haeundae.style.backgroundColor = '#ffffff';
       }else if(where == 9){
       	mapsrc.src = "img/check/sasang.png";
       	sasang.style.border = 'none';
   	    sasang.style.backgroundColor = 'rgb(211, 217, 234)';
           gangseo.style.border = 'none';
           gangseo.style.backgroundColor = '#ffffff';
           geumjeong.style.border = 'none';
           geumjeong.style.backgroundColor = '#ffffff';
           gijang.style.border = 'none';
           gijang.style.backgroundColor = '#ffffff';
           namgu.style.border = 'none';
           namgu.style.backgroundColor = '#ffffff';
           donggu.style.border = 'none';
           donggu.style.backgroundColor = '#ffffff';
           dongrae.style.border = 'none';
           dongrae.style.backgroundColor = '#ffffff';
           jingu.style.border = 'none';
           jingu.style.backgroundColor = '#ffffff';
           bukgu.style.border = 'none';
           bukgu.style.backgroundColor = '#ffffff';
           junggu.style.border = 'none';
           junggu.style.backgroundColor = '#ffffff';
           saha.style.border = 'none';
           saha.style.backgroundColor = '#ffffff';
           seogu.style.border = 'none';
           seogu.style.backgroundColor = '#ffffff';
           suyeong.style.border = 'none';
           suyeong.style.backgroundColor = '#ffffff';
           yeonje.style.border = 'none';
           yeonje.style.backgroundColor = '#ffffff';
           yeongdo.style.border = 'none';
           yeongdo.style.backgroundColor = '#ffffff';
           haeundae.style.border = 'none';
           haeundae.style.backgroundColor = '#ffffff';
       }else if(where == 10){
       	 mapsrc.src = "img/check/saha.png";
       	 saha.style.border = 'none';
            saha.style.backgroundColor = 'rgb(211, 217, 234)';
       	    gangseo.style.border = 'none';
       	    gangseo.style.backgroundColor = '#ffffff';
       	    geumjeong.style.border = 'none';
       	    geumjeong.style.backgroundColor = '#ffffff';
       	    gijang.style.border = 'none';
       	    gijang.style.backgroundColor = '#ffffff';
       	    namgu.style.border = 'none';
       	    namgu.style.backgroundColor = '#ffffff';
       	    donggu.style.border = 'none';
       	    donggu.style.backgroundColor = '#ffffff';
       	    dongrae.style.border = 'none';
       	    dongrae.style.backgroundColor = '#ffffff';
       	    jingu.style.border = 'none';
       	    jingu.style.backgroundColor = '#ffffff';
       	    bukgu.style.border = 'none';
       	    bukgu.style.backgroundColor = '#ffffff';
       	    sasang.style.border = 'none';
       	    sasang.style.backgroundColor = '#ffffff';
       	    junggu.style.border = 'none';
       	    junggu.style.backgroundColor = '#ffffff';
       	    seogu.style.border = 'none';
       	    seogu.style.backgroundColor = '#ffffff';
       	    suyeong.style.border = 'none';
       	    suyeong.style.backgroundColor = '#ffffff';
       	    yeonje.style.border = 'none';
       	    yeonje.style.backgroundColor = '#ffffff';
       	    yeongdo.style.border = 'none';
       	    yeongdo.style.backgroundColor = '#ffffff';
       	    haeundae.style.border = 'none';
       	    haeundae.style.backgroundColor = '#ffffff';
       }else if(where == 11){
       	 mapsrc.src = "img/check/seogu.png";
       	 seogu.style.border = 'none';
    	    seogu.style.backgroundColor = 'rgb(211, 217, 234)';
       	    gangseo.style.border = 'none';
       	    gangseo.style.backgroundColor = '#ffffff';
       	    geumjeong.style.border = 'none';
       	    geumjeong.style.backgroundColor = '#ffffff';
       	    gijang.style.border = 'none';
       	    gijang.style.backgroundColor = '#ffffff';
       	    namgu.style.border = 'none';
       	    namgu.style.backgroundColor = '#ffffff';
       	    donggu.style.border = 'none';
       	    donggu.style.backgroundColor = '#ffffff';
       	    dongrae.style.border = 'none';
       	    dongrae.style.backgroundColor = '#ffffff';
       	    jingu.style.border = 'none';
       	    jingu.style.backgroundColor = '#ffffff';
       	    bukgu.style.border = 'none';
       	    bukgu.style.backgroundColor = '#ffffff';
       	    sasang.style.border = 'none';
       	    sasang.style.backgroundColor = '#ffffff';
       	    saha.style.border = 'none';
       	    saha.style.backgroundColor = '#ffffff';
       	    junggu.style.border = 'none';
       	    junggu.style.backgroundColor = '#ffffff';
       	    suyeong.style.border = 'none';
       	    suyeong.style.backgroundColor = '#ffffff';
       	    yeonje.style.border = 'none';
       	    yeonje.style.backgroundColor = '#ffffff';
       	    yeongdo.style.border = 'none';
       	    yeongdo.style.backgroundColor = '#ffffff';
       	    haeundae.style.border = 'none';
       	    haeundae.style.backgroundColor = '#ffffff';
       }else if(where == 12){
       	 mapsrc.src = "img/check/suyeong.png";
       	 suyeong.style.border = 'none';
    	    suyeong.style.backgroundColor = 'rgb(211, 217, 234)';
       	    gangseo.style.border = 'none';
       	    gangseo.style.backgroundColor = '#ffffff';
       	    geumjeong.style.border = 'none';
       	    geumjeong.style.backgroundColor = '#ffffff';
       	    gijang.style.border = 'none';
       	    gijang.style.backgroundColor = '#ffffff';
       	    namgu.style.border = 'none';
       	    namgu.style.backgroundColor = '#ffffff';
       	    donggu.style.border = 'none';
       	    donggu.style.backgroundColor = '#ffffff';
       	    dongrae.style.border = 'none';
       	    dongrae.style.backgroundColor = '#ffffff';
       	    jingu.style.border = 'none';
       	    jingu.style.backgroundColor = '#ffffff';
       	    bukgu.style.border = 'none';
       	    bukgu.style.backgroundColor = '#ffffff';
       	    sasang.style.border = 'none';
       	    sasang.style.backgroundColor = '#ffffff';
       	    saha.style.border = 'none';
       	    saha.style.backgroundColor = '#ffffff';
       	    seogu.style.border = 'none';
       	    seogu.style.backgroundColor = '#ffffff';
       	    junggu.style.border = 'none';
       	    junggu.style.backgroundColor = '#ffffff';
       	    yeonje.style.border = 'none';
       	    yeonje.style.backgroundColor = '#ffffff';
       	    yeongdo.style.border = 'none';
       	    yeongdo.style.backgroundColor = '#ffffff';
       	    haeundae.style.border = 'none';
       	    haeundae.style.backgroundColor = '#ffffff';
       }else if(where == 13){
       	mapsrc.src = "img/check/yeonjegu.png";
       	yeonje.style.border = 'none';
   	    yeonje.style.backgroundColor = 'rgb(211, 217, 234)';
           gangseo.style.border = 'none';
           gangseo.style.backgroundColor = '#ffffff';
           geumjeong.style.border = 'none';
           geumjeong.style.backgroundColor = '#ffffff';
           gijang.style.border = 'none';
           gijang.style.backgroundColor = '#ffffff';
           namgu.style.border = 'none';
           namgu.style.backgroundColor = '#ffffff';
           donggu.style.border = 'none';
           donggu.style.backgroundColor = '#ffffff';
           dongrae.style.border = 'none';
           dongrae.style.backgroundColor = '#ffffff';
           jingu.style.border = 'none';
           jingu.style.backgroundColor = '#ffffff';
           bukgu.style.border = 'none';
           bukgu.style.backgroundColor = '#ffffff';
           sasang.style.border = 'none';
           sasang.style.backgroundColor = '#ffffff';
           saha.style.border = 'none';
           saha.style.backgroundColor = '#ffffff';
           seogu.style.border = 'none';
           seogu.style.backgroundColor = '#ffffff';
           suyeong.style.border = 'none';
           suyeong.style.backgroundColor = '#ffffff';
           junggu.style.border = 'none';
           junggu.style.backgroundColor = '#ffffff';
           yeongdo.style.border = 'none';
           yeongdo.style.backgroundColor = '#ffffff';
           haeundae.style.border = 'none';
           haeundae.style.backgroundColor = '#ffffff';
       }else if(where == 14){
       	mapsrc.src = "img/check/yeongdo.png";
       	yeongdo.style.border = 'none';
           yeongdo.style.backgroundColor = 'rgb(211, 217, 234)';
           gangseo.style.border = 'none';
           gangseo.style.backgroundColor = '#ffffff';
           geumjeong.style.border = 'none';
           geumjeong.style.backgroundColor = '#ffffff';
           gijang.style.border = 'none';
           gijang.style.backgroundColor = '#ffffff';
           namgu.style.border = 'none';
           namgu.style.backgroundColor = '#ffffff';
           donggu.style.border = 'none';
           donggu.style.backgroundColor = '#ffffff';
           dongrae.style.border = 'none';
           dongrae.style.backgroundColor = '#ffffff';
           jingu.style.border = 'none';
           jingu.style.backgroundColor = '#ffffff';
           bukgu.style.border = 'none';
           bukgu.style.backgroundColor = '#ffffff';
           sasang.style.border = 'none';
           sasang.style.backgroundColor = '#ffffff';
           saha.style.border = 'none';
           saha.style.backgroundColor = '#ffffff';
           seogu.style.border = 'none';
           seogu.style.backgroundColor = '#ffffff';
           suyeong.style.border = 'none';
           suyeong.style.backgroundColor = '#ffffff';
           yeonje.style.border = 'none';
           yeonje.style.backgroundColor = '#ffffff';
           junggu.style.border = 'none';
           junggu.style.backgroundColor = '#ffffff';
           haeundae.style.border = 'none';
           haeundae.style.backgroundColor = '#ffffff';
       }else if(where == 15){
       	mapsrc.src = "img/check/donggu.png";
       	junggu.style.border = 'none';
           junggu.style.backgroundColor = 'rgb(211, 217, 234)';
           gangseo.style.border = 'none';
           gangseo.style.backgroundColor = '#ffffff';
           geumjeong.style.border = 'none';
           geumjeong.style.backgroundColor = '#ffffff';
           gijang.style.border = 'none';
           gijang.style.backgroundColor = '#ffffff';
           namgu.style.border = 'none';
           namgu.style.backgroundColor = '#ffffff';
           donggu.style.border = 'none';
           donggu.style.backgroundColor = '#ffffff';
           dongrae.style.border = 'none';
           dongrae.style.backgroundColor = '#ffffff';
           jingu.style.border = 'none';
           jingu.style.backgroundColor = '#ffffff';
           bukgu.style.border = 'none';
           bukgu.style.backgroundColor = '#ffffff';
           sasang.style.border = 'none';
           sasang.style.backgroundColor = '#ffffff';
           saha.style.border = 'none';
           saha.style.backgroundColor = '#ffffff';
           seogu.style.border = 'none';
           seogu.style.backgroundColor = '#ffffff';
           suyeong.style.border = 'none';
           suyeong.style.backgroundColor = '#ffffff';
           yeonje.style.border = 'none';
           yeonje.style.backgroundColor = '#ffffff';
           yeongdo.style.border = 'none';
           yeongdo.style.backgroundColor = '#ffffff';
           haeundae.style.border = 'none';
           haeundae.style.backgroundColor = '#ffffff';
       }else if(where == 16){
       	 mapsrc.src = "img/check/haeundae.png";
       	 haeundae.style.border = 'none';
            haeundae.style.backgroundColor = 'rgb(211, 217, 234)';
       	    gangseo.style.border = 'none';
       	    gangseo.style.backgroundColor = '#ffffff';
       	    geumjeong.style.border = 'none';
       	    geumjeong.style.backgroundColor = '#ffffff';
       	    gijang.style.border = 'none';
       	    gijang.style.backgroundColor = '#ffffff';
       	    namgu.style.border = 'none';
       	    namgu.style.backgroundColor = '#ffffff';
       	    donggu.style.border = 'none';
       	    donggu.style.backgroundColor = '#ffffff';
       	    dongrae.style.border = 'none';
       	    dongrae.style.backgroundColor = '#ffffff';
       	    jingu.style.border = 'none';
       	    jingu.style.backgroundColor = '#ffffff';
       	    bukgu.style.border = 'none';
       	    bukgu.style.backgroundColor = '#ffffff';
       	    sasang.style.border = 'none';
       	    sasang.style.backgroundColor = '#ffffff';
       	    saha.style.border = 'none';
       	    saha.style.backgroundColor = '#ffffff';
       	    seogu.style.border = 'none';
       	    seogu.style.backgroundColor = '#ffffff';
       	    suyeong.style.border = 'none';
       	    suyeong.style.backgroundColor = '#ffffff';
       	    yeonje.style.border = 'none';
       	    yeonje.style.backgroundColor = '#ffffff';
       	    yeongdo.style.border = 'none';
       	    yeongdo.style.backgroundColor = '#ffffff';
       	    junggu.style.border = 'none';
       	    junggu.style.backgroundColor = '#ffffff';
       }else if(where == 6){
       	mapsrc.src = "img/check/dongrae.png";
       	dongrae.style.border = 'none';
           dongrae.style.backgroundColor = 'rgb(211, 217, 234)';
           gangseo.style.border = 'none';
           gangseo.style.backgroundColor = '#ffffff';
           geumjeong.style.border = 'none';
           geumjeong.style.backgroundColor = '#ffffff';
           gijang.style.border = 'none';
           gijang.style.backgroundColor = '#ffffff';
           namgu.style.border = 'none';
           namgu.style.backgroundColor = '#ffffff';
           donggu.style.border = 'none';
           donggu.style.backgroundColor = '#ffffff';
           junggu.style.border = 'none';
           junggu.style.backgroundColor = '#ffffff';
           jingu.style.border = 'none';
           jingu.style.backgroundColor = '#ffffff';
           bukgu.style.border = 'none';
           bukgu.style.backgroundColor = '#ffffff';
           sasang.style.border = 'none';
           sasang.style.backgroundColor = '#ffffff';
           saha.style.border = 'none';
           saha.style.backgroundColor = '#ffffff';
           seogu.style.border = 'none';
           seogu.style.backgroundColor = '#ffffff';
           suyeong.style.border = 'none';
           suyeong.style.backgroundColor = '#ffffff';
           yeonje.style.border = 'none';
           yeonje.style.backgroundColor = '#ffffff';
           yeongdo.style.border = 'none';
           yeongdo.style.backgroundColor = '#ffffff';
           haeundae.style.border = 'none';
           haeundae.style.backgroundColor = '#ffffff';
       }
       
    }
 })
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


</html>