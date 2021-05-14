<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="${cpath }/resources/css/index.css"></link>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
</head>
<body>
   <div id="intro" class="type">
        <div class="wrap">
            <span class="logo">
                <img src="${cpath }/img/Busanlogo.png" alt="부산광역시 로고">
            </span>

            <div class="indexWrap">
              <div class="leftB">
                  <a href="https://www.busan.go.kr/covid19/Prevention07.do">
                     <div class="covid">
                        <div class="covid_in_1">사회적 거리두기 2단계 유지</div>
                        <div class="covid_in_2">(5월 3일 0시 ~ 5월 23일 24시)</div>
                     </div>
                   </a>
               </div>
                <div class="rightB">
               <div class="slide">
                  <c:forEach var="i" begin="0" end="${localListSize - 1}">
                         <div class="weatherd_${i}">
                            <div class="weather_inl_${i}"></div>
                            <div class="weather_inr_${i}">
                               <div class="inr_local_${i}"></div>
                               <div class="inr_t3h_${i}"></div>
                               <div class="inr_pop_${i}"></div>
                            </div>
                         </div>
                  </c:forEach>
               </div>
                  </div>
            </div>

            <ul class="introList">
                <li class="item item1">
                    <a href="${cpath }/food">
                        <div class="img">
                            <img src="${cpath }/img/restaurant.jpg">
                        </div>
                        <div class="txt">
                            <h2>음식점</h2>
                            <p>음식점 설명</p>
                        </div>
                    </a>
                </li>
                <li class="item item2">
                    <a href="${cpath }/cafe">
                        <div class="img">
                            <img src="${cpath }/img/cafe.jpg">
                        </div>
                        <div class="txt">
                            <h2>카페</h2>
                            <p>카페 설명</p>
                        </div>
                    </a>
                </li>
                <li class="item item3">
                    <a href="${cpath }/tour">
                        <div class="img">
                            <img src="${cpath }/img/tourist.jpg">
                        </div>
                        <div class="txt">
                            <h2>관광지</h2>
                            <p>관광지 설명</p>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- footer -->
    <div class="copyWrap">
        <div class="copy">
            <p>Copyright © Busan Metropolitan City. All rights reserved.</p>
        </div>
    </div>
</body>
<script type="text/javascript">
	function realTimeWeather(x,y,name,index) {
	    var today = new Date();
	    var year = today.getFullYear();
	    var month = today.getMonth()+1;
	    var day = today.getDate();
	    var hours = today.getHours();
	    var minutes = today.getMinutes();
	    
	    /* 좌표 */
	    var _nx = x, _ny = y,
	    apikey = "N3pw1Kne0KhxwSKXZpC37OAa44kzvmXeLx71eL7qRW75K63A%2BiX" + 
	    			"E1wp2lB4lG3nfN3A1wQlmXxESpoW0UHgzDQ%3D%3D",    
	    ForecastGribURL = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst";
	    ForecastGribURL += "?serviceKey=" + apikey;
	    ForecastGribURL += "&numOfRows=10&pageNo=1";
	    ForecastGribURL += "&base_date=" + '${today}';
	    ForecastGribURL += "&base_time=" + '1100';
	    ForecastGribURL += "&nx=" + _nx + "&ny=" + _ny;
	    ForecastGribURL += "&dataType=json";
	   
	       
		$.ajax({
		   url: ForecastGribURL
		   ,type: 'GET'
		   ,success: function(msg) {
		
		      console.log(msg.response);
		         const items = msg.response.body.items;
		         items.item.forEach(e => {
		            console.log(e.category + " : " + e.fcstValue);
		         });
		      
		         var SKY = msg.response.body.items.item[3].fcstValue;
		         var T3H = msg.response.body.items.item[4].fcstValue;
		         var POP = msg.response.body.items.item[0].fcstValue;
		         var REH = msg.response.body.items.item[2].fcstValue;
		         var WSD = msg.response.body.items.item[9].fcstValue;
		         var PTY = msg.response.body.items.item[1].fcstValue;
		        
		         var weather;
		         
		         if(PTY == 0){
		            if(SKY == 1){
		               weather = "맑음";
		            }
		            else if(SKY == 3){
		               weather = "구름많음";
		            }
		            else if(SKY == 4){
		               weather = "흐림";
		            }
		         }
		         else {
		            if(PTY == 1){
		               weather = "비";
		            }
		            else if(PTY == 2){
		               weather = "비,눈";
		            }
		            else if(PTY == 3){
		               weather = "눈";
		            }
		            else if(PTY == 4){
		               weather = "소나기";
		            }                
		            else if(PTY == 5){
		               weather = "빗방울";
		            }
		            else if(PTY == 6){
		               weather = "빗방울,눈날림"
		            }
		            else if(PTY == 7) {
		               weather = "눈날림";
		            }
		         }
		      
		         $('.weather_inl_' + index).html('<img src="${cpath}/resources/weatherImg/'
		         							+ weather + '.png" width="95px" height="90px">');
		      
		         $('.inr_local_' + index).html(
		            "부산시 " + name + " (" + month + "월" + day + "일)"
		         );
		         $('.inr_t3h_' + index).html(
		       			 "기온 : " + T3H + " ℃ \n"
		  		   );
		         
		      $('.inr_pop_' + index).html(
		            "강수확률 : " + POP + " % (" + weather + ")"
		      );
		    } //success func 종료
		})    
	}

	realTimeWeather('${localList.get(0).getX()}',
	            '${localList.get(0).getY()}',
	            '${localList.get(0).getName()}',
	            0);
	realTimeWeather('${localList.get(1).getX()}',
	            '${localList.get(1).getY()}',
	            '${localList.get(1).getName()}',
	            1);
	realTimeWeather('${localList.get(2).getX()}',
	            '${localList.get(2).getY()}',
	            '${localList.get(2).getName()}',
	            2);
	realTimeWeather('${localList.get(3).getX()}',
	            '${localList.get(3).getY()}',
	            '${localList.get(3).getName()}',
	            3);
	realTimeWeather('${localList.get(4).getX()}',
	            '${localList.get(4).getY()}',
	            '${localList.get(4).getName()}',
	            4);
	realTimeWeather('${localList.get(5).getX()}',
	            '${localList.get(5).getY()}',
	            '${localList.get(5).getName()}',
	            5);
	realTimeWeather('${localList.get(6).getX()}',
	            '${localList.get(6).getY()}',
	            '${localList.get(6).getName()}',
	            6);
	realTimeWeather('${localList.get(7).getX()}',
	            '${localList.get(7).getY()}',
	            '${localList.get(7).getName()}',
	            7);
	realTimeWeather('${localList.get(8).getX()}',
	            '${localList.get(8).getY()}',
	            '${localList.get(8).getName()}',
	            8);
	realTimeWeather('${localList.get(9).getX()}',
	            '${localList.get(9).getY()}',
	            '${localList.get(9).getName()}',
	            9);
	realTimeWeather('${localList.get(10).getX()}',
	            '${localList.get(10).getY()}',
	            '${localList.get(10).getName()}',
	            10);
	realTimeWeather('${localList.get(11).getX()}',
	            '${localList.get(11).getY()}',
	            '${localList.get(11).getName()}',
	            11);
	realTimeWeather('${localList.get(12).getX()}',
	            '${localList.get(12).getY()}',
	            '${localList.get(12).getName()}',
	            12);
	realTimeWeather('${localList.get(13).getX()}',
	            '${localList.get(13).getY()}',
	            '${localList.get(13).getName()}',
	            13);
	realTimeWeather('${localList.get(14).getX()}',
	            '${localList.get(14).getY()}',
	            '${localList.get(14).getName()}',
	            14);
	realTimeWeather('${localList.get(15).getX()}',
	            '${localList.get(15).getY()}',
	            '${localList.get(15).getName()}',
	            15);

</script>

</html>