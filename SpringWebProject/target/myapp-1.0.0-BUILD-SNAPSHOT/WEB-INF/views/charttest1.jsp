<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<title>JSP Page</title>
<link
	href="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<script
	src="<%=application.getContextPath()%>/resources/jquery/jquery-3.2.1.min.js"
	type="text/javascript"></script>
<script
	src="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/js/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="<%=application.getContextPath()%>/resources/highcharts/code/highcharts.js"></script>
<script
	src="<%=application.getContextPath()%>/resources/highcharts/code/highcharts-more.js"></script>
<script
	src="<%=application.getContextPath()%>/resources/highcharts/code/modules/exporting.js"></script>
<script
	src="<%=application.getContextPath()%>/resources/highcharts/code/themes/gray.js"></script>
<script
	src="<%=application.getContextPath()%>/resources/highcharts/code/modules/solid-gauge.js"></script>
<script
	src="<%=application.getContextPath()%>/resources/js/ultrasonicsensorchart.js"></script>


<link
	href="<%=application.getContextPath()%>/resources/css/roundslider.min.css"
	rel="stylesheet" />
<script
	src="<%=application.getContextPath()%>/resources/js/roundslider.min.js"></script>
<link
	href="<%=application.getContextPath()%>/resources/css/ultraslider.css"
	rel="stylesheet"></link>
<script
	src="<%=application.getContextPath()%>/resources/js/laseremitter.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/buzzer.js"></script>

<!-- 기존 센서 -->
<%-- 
		<script src="<%=application.getContextPath()%>/resources/js/camera.js"></script>
		<script src="<%=application.getContextPath()%>/resources/js/rgbled.js"></script>
		<script src="<%=application.getContextPath()%>/resources/js/laseremitter.js"></script>
		<script src="<%=application.getContextPath()%>/resources/js/buzzer.js"></script>
		<script src="<%=application.getContextPath()%>/resources/js/ultrasonicsensor.js"></script>
		<script src="<%=application.getContextPath()%>/resources/js/lcd.js"></script>
		<script src="<%=application.getContextPath()%>/resources/js/fronttire.js"></script>
		<script src="<%=application.getContextPath()%>/resources/js/backtire.js"></script>
		 --%>
<!-- 기존 센서 차트-->
<%-- 
		<script src="<%=application.getContextPath()%>/resources/js/thermistorsensorchart.js"></script>
		<script src="<%=application.getContextPath()%>/resources/js/ultrasonicsensorchart.js"></script>		
		<script src="<%=application.getContextPath()%>/resources/js/photoresistorsensorchart.js"></script>
		<script src="<%=application.getContextPath()%>/resources/js/gassensorchart.js"></script>
		 --%>
<%-- <script src="<%=application.getContextPath()%>/resources/js/trackingsensorchart.js"></script> 
		 <script src="<%=application.getContextPath()%>/resources/js/sensorchart.js"></script>--%>
<!-- 추가 센서 차트-->
<script
	src="<%=application.getContextPath()%>/resources/js/sensorchart.js"></script>
<script type="text/javascript">
	ws = new WebSocket("ws://" + location.host
			+ "/SpringWebProject/websocket/ultrasonicsensor");
	

	/*
	//ws.onopen=handleOnOpen;
	ws.onmessage = handleOnMessage;
	//ws.onclose=handleOnClose;

	function handleOnMessage(event) {
		var data = JSON.parse(event.data); //JSON.parse는 문자열로 되어있는 제이슨( '{"xxx":"value"}')을 javascript객체( {"xxx":"value"} )로 만들어주는 작업을함
		$("#ultrasonicsensorStatus").html("앞차와의 거리 :" + data.distance + ";");
	}
	 */
	
</script>

<!-- 스타일 폰트 -->

<style>
body {
	font: 13px/20px 'Lucida Grande', Tahoma, Verdana, sans-serif;
	color: #404040;
	background: #3b3f46;
}

.container {
	margin: 0 auto;
	padding: 90px 0;
	width: 400px;
	background-image: -webkit-radial-gradient(center, farthest-side, rgba(255, 255, 255, 0.1),
		rgba(255, 255, 255, 0));
	background-image: -moz-radial-gradient(center, farthest-side, rgba(255, 255, 255, 0.1),
		rgba(255, 255, 255, 0));
	background-image: -o-radial-gradient(center, farthest-side, rgba(255, 255, 255, 0.1),
		rgba(255, 255, 255, 0));
	background-image: radial-gradient(center, farthest-side, rgba(255, 255, 255, 0.1),
		rgba(255, 255, 255, 0));
}

.switch {
	position: relative;
	margin: 20px auto;
	height: 26px;
	width: 120px;
	background: rgba(0, 0, 0, 0.25);
	border-radius: 3px;
	-webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.3), 0 1px
		rgba(255, 255, 255, 0.1);
	box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.3), 0 1px
		rgba(255, 255, 255, 0.1);
}

.switch-label {
	position: relative;
	z-index: 2;
	float: left;
	width: 58px;
	line-height: 26px;
	font-size: 11px;
	color: rgba(255, 255, 255, 0.35);
	text-align: center;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.45);
	cursor: pointer;
}

.switch-label:active {
	font-weight: bold;
}

.switch-label-off {
	padding-left: 2px;
}

.switch-label-on {
	padding-right: 2px;
}

/*
 * Note: using adjacent or general sibling selectors combined with
 *       pseudo classes doesn't work in Safari 5.0 and Chrome 12.
 *       See this article for more info and a potential fix:
 *       http://css-tricks.com/webkit-sibling-bug/
 */
.switch-input {
	display: none;
}

.switch-input:checked+.switch-label {
	font-weight: bold;
	color: rgba(0, 0, 0, 0.65);
	text-shadow: 0 1px rgba(255, 255, 255, 0.25);
	-webkit-transition: 0.15s ease-out;
	-moz-transition: 0.15s ease-out;
	-o-transition: 0.15s ease-out;
	transition: 0.15s ease-out;
}

.switch-input:checked+.switch-label-on ~ .switch-selection {
	left: 60px;
	/* Note: left: 50% doesn't transition in WebKit */
}

.switch-selection {
	display: block;
	position: absolute;
	z-index: 1;
	top: 2px;
	left: 2px;
	width: 58px;
	height: 22px;
	background: #65bd63;
	border-radius: 3px;
	background-image: -webkit-linear-gradient(top, #9dd993, #65bd63);
	background-image: -moz-linear-gradient(top, #9dd993, #65bd63);
	background-image: -o-linear-gradient(top, #9dd993, #65bd63);
	background-image: linear-gradient(to bottom, #9dd993, #65bd63);
	-webkit-box-shadow: inset 0 1px rgba(255, 255, 255, 0.5), 0 0 2px
		rgba(0, 0, 0, 0.2);
	box-shadow: inset 0 1px rgba(255, 255, 255, 0.5), 0 0 2px
		rgba(0, 0, 0, 0.2);
	-webkit-transition: left 0.15s ease-out;
	-moz-transition: left 0.15s ease-out;
	-o-transition: left 0.15s ease-out;
	transition: left 0.15s ease-out;
}

.switch-blue .switch-selection {
	background: #3aa2d0;
	background-image: -webkit-linear-gradient(top, #4fc9ee, #3aa2d0);
	background-image: -moz-linear-gradient(top, #4fc9ee, #3aa2d0);
	background-image: -o-linear-gradient(top, #4fc9ee, #3aa2d0);
	background-image: linear-gradient(to bottom, #4fc9ee, #3aa2d0);
}

.switch-yellow .switch-selection {
	background: #c4bb61;
	background-image: -webkit-linear-gradient(top, #e0dd94, #c4bb61);
	background-image: -moz-linear-gradient(top, #e0dd94, #c4bb61);
	background-image: -o-linear-gradient(top, #e0dd94, #c4bb61);
	background-image: linear-gradient(to bottom, #e0dd94, #c4bb61);
}
</style>

</head>

<body style="background-color: black;">

	<h4>splinechart</h4>


<input type="hidden" id="ultraangle" value=" ${angle}"/>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4">
				<div id="1ChartContainer"
					style="height: 230px; margin-top: 20px; border: 1px solid white;">${angle }</div>
			</div>
			<div class="col-md-4">
				<div id="2ChartContainer"
					style="height: 230px; margin-top: 20px; border: 1px solid white;"></div>
			</div>
			<div class="col-md-4">
				<div id="3ChartContainer"
					style="height: 230px; margin-top: 20px; border: 1px solid white;"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div id="ultraSensorChartContainer"
					style="height: 230px; margin-top: 20px; border: 1px solid white;"></div>
			</div>
			<div class="col-md-4">
				<div id="3ChartContainer"
					style="height: 230px; margin-top: 20px; border: 1px solid white;">
					
					<div id="ultrahandle"
						style="height: 100px; margin-top: 20px; border: 1px solid white;"></div>
				</div>
			</div>
			<div class="col-md-4">
				<div id="5ChartContainer"
					style="height: 230px; margin-top: 20px; border: 1px solid white;">
					
					<input id="laserOn" <c:if test="${laseremitterStatus=='off'}">onclick="laseremitter('change','on')" </c:if>
					<c:if test="${laseremitterStatus=='on'}">onclick="laseremitter('change','off')" </c:if> <c:if test="${laseremitterStatus=='off'}">type="image" src="<%=application.getContextPath()%>/resources/image/laserOn.PNG"</c:if> <c:if test="${laseremitterStatus=='on'}">type="image" src="<%=application.getContextPath()%>/resources/image/star100.png"</c:if>/>
					<input id="buzzerOn" <c:if test="${buzzerStatus=='off'}">onclick="buzzer('change','on')" </c:if>
					<c:if test="${buzzerStatus=='on'}">onclick="buzzer('change','off')" </c:if> 
					<c:if test="${buzzerStatus=='off'}">type="image" src="<%=application.getContextPath()%>/resources/image/laserOn.PNG"</c:if> <c:if test="${buzzerStatus=='on'}">type="image" src="<%=application.getContextPath()%>/resources/image/star100.png"</c:if>/>
					
				</div>

			</div>



		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="row">
					<div class="col-md-6">
						<div id="thermistorimg"
							style="height: 100px; margin-top: 20px; border: 1px solid white;">
						</div>
					</div>
					<div class="col-md-6">
						<div id="trackingsensor"
							style="height: 100px; margin-top: 20px; border: 1px solid white;">TRACKING</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div id="photoresistorimg"
							style="height: 100px; margin-top: 20px; border: 1px solid white;">
						</div>
					</div>
					<div class="col-md-6">
						<div id="gasimg"
							style="height: 100px; margin-top: 20px; border: 1px solid white;">
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div id="sensorChartContainer"
					style="height: 230px; margin-top: 20px; border: 1px solid white;"></div>
			</div>
		</div>
	</div>
	<script
		src="<%=application.getContextPath()%>/resources/js/ultraslider.js"></script>


</body>
</html>