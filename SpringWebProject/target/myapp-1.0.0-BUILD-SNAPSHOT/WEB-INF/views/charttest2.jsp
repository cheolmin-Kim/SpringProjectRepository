<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport"	content="width=device-width, initial-scale=1, user-scalable=no">
		<title>JSP Page</title>
		<link	href="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/css/bootstrap.min.css"rel="stylesheet" type="text/css" />
		<script src="<%=application.getContextPath()%>/resources/jquery/jquery-3.2.1.min.js"	type="text/javascript"></script>
		<script src="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="<%=application.getContextPath()%>/resources/highcharts/code/highcharts.js"></script>
		<script src="<%=application.getContextPath()%>/resources/highcharts/code/themes/gray.js"></script>
		<script src="<%=application.getContextPath()%>/resources/highcharts/code/highcharts-more.js"></script>
		<script src="<%=application.getContextPath()%>/resources/highcharts/code/modules/solid-gauge.js"></script>	
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
		 <%-- <script src="<%=application.getContextPath()%>/resources/js/trackingsensorchart.js"></script> --%>
		<!-- 추가 센서 차트-->
		<script src="<%=application.getContextPath()%>/resources/js/sensorchart.js"></script>
		<link href="<%= application.getContextPath() %>/resources/css/roundslider.min.css" rel="stylesheet" />
		<script src="<%= application.getContextPath() %>/resources/js/roundslider.min.js"></script>
		<style>@media screen and (min-width: 480px) { #title { height: 10px; } }</style>
		<script src="<%=application.getContextPath()%>/resources/js/backtire.js"></script>
		<link href="<%= application.getContextPath() %>/resources/css/frontcontrol.css" rel="stylesheet" />
		
		
	</head>
	
	<body style="background-color: black;">
		
		<h4>splinechart</h4>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4">
					<div id="1ChartContainer"
						style="height: 230px; margin-top: 20px; border: 1px solid white;"></div>
				</div>
				<div class="col-md-4">
					<div id="2ChartContainer"
						style="height: 230px; margin-top: 20px; border: 1px solid white;"></div>
				</div>
				<div class="col-md-4">
					<div id="3ChartContainer"
						style="height: 230px; margin-top: 20px; border: 1px solid white;">
						<div id="slider" class="rslider" style="float:left;background-color: black"></div>
    					<div id="container-speed" style="width: 300px; height: 200px; float: right"></div><br/>
						<div style="float:left;background-color: black">
							<input type="hidden" id="angle" value="${fronttireAngle}"/>
							<input type="hidden" id="speed" value="${backtireSpeed}"/>
							<input type="hidden" id="direction" value="${backtireDirection}"/>
							<button onclick="backtire('change', '${backtireDirection}','500')" style="color: black;">1</button>
							<button onclick="backtire('change', '${backtireDirection}','900')" style="color: black;">2</button>
							<button onclick="backtire('change', '${backtireDirection}','1200')" style="color: black;">3</button>
							<button onclick="backtire('change', '${backtireDirection}','1700')" style="color: black;">4</button>
							<button onclick="backtire('change', '${backtireDirection}','2000')" style="color: black;">5</button>
							<button onclick="backtire('change', '${backtireDirection}','2600')" style="color: black;">6</button><br/>								
							<span id="fronttireStatus">Angle : ${fronttireAngle}</span><br/>
							<span id="backtireStatus">direction : ${backtireDirection} | speed : ${backtireSpeed}</span><br/>
						</div><br/>
						<button type="button" class="btn btn-warning" onclick="backtire('change', 'forward','${backtireSpeed}')" style="margin-bottom: 5px;">전진</button>
						<button type="button" class="btn btn-info" onclick="backtire('change', 'backward','${backtireSpeed}')" style="margin-bottom: 5px;">후진</button><br/>	
						<!-- <button onmousedown="accelerator('${backtireDirection}')" onmouseup="stop()" style="color: black;"> -->
						<button id="accl" style="color: black;">가속 패달</button>									
						<button onclick="stop()" style="color: black;">정지 패달</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div id="4ChartContainer"
						style="height: 230px; margin-top: 20px; border: 1px solid white;"></div>
				</div>
				<div class="col-md-4">
					<div id="5ChartContainer"
						style="height: 230px; margin-top: 20px; border: 1px solid white;"></div>
				</div>
				<div class="col-md-4">
					<div id="6ChartContainer"
						style="height: 230px; margin-top: 20px; border: 1px solid white;"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4" >
					<div class="row">
						<div class="col-md-6" >
							<div id="thermistorimg" style="height: 100px; margin-top: 20px; border: 1px solid white;">	</div>
						</div>
						<div class="col-md-6" >
							<div id="trackingsensor" style="height: 100px; margin-top: 20px; border: 1px solid white;">TRACKING</div>
						</div>
					</div>			
					<div class="row">
						<div class="col-md-6" >
							<div id="photoresistorimg" style="height: 100px; margin-top: 20px; border: 1px solid white;">	</div>
						</div>
						<div class="col-md-6" >
							<div id="gasimg" style="height: 100px; margin-top: 20px; border: 1px solid white;">	</div>
						</div>
					</div>			
				</div>				
				<div class="col-md-8">
					<div id="sensorChartContainer" style="height: 230px; margin-top: 20px; border: 1px solid white;"></div>			
				</div>
			</div>	
		</div>
		<script src="<%=application.getContextPath()%>/resources/js/fronttire.js"></script>
		<script src="<%=application.getContextPath()%>/resources/js/speedgauge.js"></script>
	</body>
</html>