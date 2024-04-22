document.addEventListener("DOMContentLoaded", function () {
    const userInfoButton = document.getElementById("userInfoButton");
    const userInfoContainer = document.querySelector(".userContainer");

    const programButton = document.getElementById("programButton");
    const programContainer = document.querySelector(".programContainer");

    const nutrionProgramButton = document.getElementById("nutrionProgramButton");
    const nutrionProgramContainer = document.querySelector(".nutrionProgramContainer");

    userInfoContainer.style.display = "flex";
    programContainer.style.display = "none";
    nutrionProgramContainer.style.display = "none";

    userInfoButton.addEventListener("click", function () {
        userInfoContainer.style.display = "flex";
        programContainer.style.display = "none";
        nutrionProgramContainer.style.display = "none";
    });

    programButton.addEventListener("click", function () {
        userInfoContainer.style.display = "none";
        programContainer.style.display = "flex";
        nutrionProgramContainer.style.display = "none";
    });

    nutrionProgramButton.addEventListener("click", function () {
        userInfoContainer.style.display = "none";
        programContainer.style.display = "none";
        nutrionProgramContainer.style.display = "flex";
    });
});

document.getElementById('programSelect').addEventListener('change', function() {
    var selectedProgram = this.value;
    var allPrograms = document.querySelectorAll('.progrInfoTextConteiner');
    allPrograms.forEach(function(program) {
        program.style.display = 'none';
    });
    var selectedProgramInfo = document.getElementById('progrInfo_' + selectedProgram);
    if (selectedProgramInfo) {
        selectedProgramInfo.style.display = 'flex';
    }
});

var timer = 0;
var timerInterval;
var ms = document.getElementById('ms');
var second = document.getElementById('second');
var minute = document.getElementById('minute');

function vpered() {
    sanovka();
    timerInterval = setInterval(function() {
        timer += 1/60;
        msVal = Math.floor((timer - Math.floor(timer))*100);
        secondVal = Math.floor(timer) - Math.floor(timer/60) * 60;
        minuteVal = Math.floor(timer/60);
        ms.innerHTML = msVal < 10 ? "0" + msVal.toString() : msVal;
        second.innerHTML = secondVal < 10 ? "0" + secondVal.toString() : secondVal;
        minute.innerHTML = minuteVal < 10 ? "0" + minuteVal.toString() : minuteVal;
    }, 1000/60);
}

function sanovka() {
    clearInterval(timerInterval);
}

function sbrosit(){
    clearInterval(timerInterval);
    timer = 0;
    ms.innerHTML = "00";
    second.innerHTML = "00";
    minute.innerHTML = "00";
}
