<!DOCTYPE html>
<html lang="en">
<head>
    
    <style>
    body {
    background-color: #DADED4;
}
h1 {
  color: #3C403D;
  font-family: Verdana;
  text-align: center;
  margin: 0 0 20px;
  padding: 10px;
}

p {
  color: #707070;
  font-size:18px;
}

.myButton {
	background-color:#9ab8b0;
	border-radius:23px;
	border:2px solid #a9b0ae;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Verdana;
	font-size:14px;
	padding:3px 7px;
	text-decoration:none;
	text-shadow:0px 1px 0px #2b665e;
}

.myButton:hover {
	background-color:#598f8f;
}
.myButton:active {
	position:relative;
	top:1px;
}

.myButton1 {
	background-color: green;
	border-radius:23px;
	border:2px solid #4d4f4f;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Verdana;
	font-size:14px;
	padding:3px 7px;
	text-decoration:none;
	text-shadow:0px 1px 0px #2b665e;
}
.myButton1:hover {
	background-color:#598f8f;
}
.myButton1:active {
	position:relative;
	top:1px;
}

.myButton2 {
	background-color: #bf1a11;
	border-radius:23px;
	border:2px solid #4d4f4f;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Verdana;
	font-size:14px;
	padding:3px 7px;
	text-decoration:none;
	text-shadow:0px 1px 0px #2b665e;
}
.myButton2:hover {
	background-color:#598f8f;
}
.myButton2:active {
	position:relative;
	top:1px;
}

.myButton3 {
	background-color: #cad417;
	border-radius:23px;
	border:2px solid #4d4f4f;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Verdana;
	font-size:14px;
	padding:3px 7px;
	text-decoration:none;
	text-shadow:0px 1px 0px #2b665e;
}
.myButton3:hover {
	background-color:#598f8f;
}
.myButton3:active {
	position:relative;
	top:1px;
}

input[type="radio"] + label {
    color: #3C403D;
    font-family: Arial, sans-serif;
    font-size: 14px;
}

.container {
  margin: auto;
}

.one {
  width: 50%;
  height: 200px;
  float: left;
  padding: 0 70px;
}

.two {
  margin-left: 60%;
  height: 200px;
  
}

footer {
  background-color: gray;
  padding: 3em 0;
  text-align: center;
  color: white;
  font-size: 26px;
  bottom: 0;
  position: fixed;
  left: 0;
  width: 100%;
}
</style>
    <title>Tempetature and Humidity</title>
    
</head>

<body>
    
    <h1>Raspberry Pi DHT11 Webserver Demo</h1>
    <p>The values below show the date, time, temperature and humidity an Light readings from a DHT11 and ADC sensor</p>
    
    <h4> Temp Sensor ==> 
        % if DHT11:
            <a href="../DHT11/off" class="myButton">Temperature Sensing OFF</a>
        % else:
            <a href="../DHT11/on" class="myButton1">Temperature Sensing ON</a>
        % end
    </h4>
    
    <h4> Light Sensor ==> 
        % if Light:
            <a href="../Light/off" class="myButton">Light Sensing OFF</a>
        % else:
            <a href="../Light/on" class="myButton1">Light Sensing ON</a>
        % end
    </h4>
    

    <br /><br />
    
    <h3> Temperature ==> {{tempVal}} </h3>
    <h3> Humidity    ==> {{humidVal}} </h3>
	<h3> Light Value ==> {{LightVal}}  </h3>
	<h3> Error: ==> {{error}}  </h3>
	<h3> ADC Value ==> {{ADCVal}}  </h3>
	<h3> ADC Voltage ==> {{ADCVolt}} Volt </h3>
    <hr>
    <h3> Last Sensor Reading: {{myTime}} <a
href="/"class="button">Refresh</a></h3>
    <hr>
</body>
</html>