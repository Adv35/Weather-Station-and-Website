<!DOCTYPE html>
<html lang="en">
<head>
    <title>Tempetature and Humidity</title>
    <link rel="stylesheet" type="text/css" href="http://twitter.github.com/bootstrap/assets/css/bootstrap.css">
</head>
<body>
<h3> Here you can see the current and tomorrow's Weather with Pollen and Air Quality Measurements. </h3>
<script>
        (function(d, s, id) {
            if (d.getElementById(id)) {
                if (window.__TOMORROW__) {
                    window.__TOMORROW__.renderWidget();
                }
                return;
            }
            const fjs = d.getElementsByTagName(s)[0];
            const js = d.createElement(s);
            js.id = id;
            js.src = "https://www.tomorrow.io/v1/widget/sdk/sdk.bundle.min.js";

            fjs.parentNode.insertBefore(js, fjs);
        })(document, 'script', 'tomorrow-sdk');
        </script>

        <div class="tomorrow"
           data-location-id="027020"
           data-language="EN"
           data-unit-system="METRIC"
           data-skin="light"
           data-widget-type="aqiPollen"
           style="padding-bottom:22px;position:relative;"
        >
        <img
            alt="Powered by Tomorrow.io"
            rc="https://weather-website-client.tomorrow.io/img/powered-by-tomorrow.svg"
            width="140"
            height="150"
        />
        </div>
        
</body>
</html>