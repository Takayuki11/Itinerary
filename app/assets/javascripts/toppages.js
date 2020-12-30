const img = [
  "assets/aYJcTcmE5PqFLzG1608711235_1608711350.jpg",
  "assets/gdh8wUdjVPCfVtm1608711377_1608711400.jpg",
  "assets/ZrEkguK4LHAL90l1608711101_1608711183.jpg",
  "assets/HRVwbn7nrJiET1n1609308615_1609308650.jpg",
  "assets/HZ8aByRoepeNfV61609309103_1609309139.jpg",
  "assets/SaIe6xfE5R6kCtW1609306921_1609306947.jpg",
  "assets/LYGU1y2kWHLqilT1609309735_1609309842.jpg",
  "assets/LYGU1y2kWHLqilT1609309735_1609309842.jpg",
  "assets/l5XVbROuS2zLDon1609307451_1609307477.jpg",
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