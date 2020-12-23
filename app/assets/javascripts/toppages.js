const img = [
  "assets/aYJcTcmE5PqFLzG1608711235_1608711350.jpg",
  "assets/gdh8wUdjVPCfVtm1608711377_1608711400.jpg",
  "assets/ZrEkguK4LHAL90l1608711101_1608711183.jpg",
  "assets/A3QqDivSjDLEPRM1608711427_1608711465.jpg"
];
let count = -1;

const showPicture = () => {
  if(img.length == count) count = 0;
  
  $(".picture").attr("src", img[count]);
  
  count++;
  
  setTimeout("showPicture()", 5000);
};

showPicture();