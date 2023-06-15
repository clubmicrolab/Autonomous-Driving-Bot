function getRandomBattery(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function updateBatteryPercentage() {
  var batteryElement = document.getElementById("battery");
  var batteryPercentage = parseInt(batteryElement.textContent);

  if (batteryPercentage > 0) {
    batteryPercentage -= 1;
  }

  batteryElement.textContent = batteryPercentage + "%";

  if (batteryPercentage < 50) {
    document.body.style.backgroundColor = "red";
  } else {
    document.body.style.backgroundColor = "green";
  }
}

function startBatteryUpdate() {
  var batteryElement = document.getElementById("battery");
  var initialBatteryPercentage = getRandomBattery(50, 100);
  batteryElement.textContent = initialBatteryPercentage + "%";

  if (initialBatteryPercentage < 50) {
    document.body.style.backgroundColor = "red";
  } else {
    document.body.style.backgroundColor = "green";
  }

  setInterval(updateBatteryPercentage, 40000); 
}

startBatteryUpdate();
