let lat = 0;
let lon = 0;

let city = "";
let temp = 0;
let desc = "";
let imgUrl = ""


window.onload = function(){
    getLocation();
}

// navigator.geolocation
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        document.body.innerHTML = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
    console.log("Latitude: " + position.coords.latitude);
    console.log("Longitude: " + position.coords.longitude);
    
    lat = position.coords.latitude;     // 위도 
    lon = position.coords.longitude;    // 경도

    // get api
    $.ajax({
        method : 'get',
        url : `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=7e2db2adcb908531b7eff18336d44f6e`,
        async : true
    })
    .done(res =>{
        console.log(res);
        
        city = res.name;
        temp = Math.round((res.main.temp-273.15)*100)/100; // K to C
        desc = res.weather[0].description;
        imgUrl = `./img/SKY${(res.weather[0].icon).split('d')[0]}.png`;

        console.log(`${city} : ${temp}'C (${desc})`);
        console.log('imgUrl:',imgUrl);
        
        const result = `<div><img src=${imgUrl}><br><p>${city}<br>${temp}'C</p>${desc}<p></p></div>`;
        $('body').append(result);

    });
}