<script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
      mapOption = {
          center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
          level: 3 // 지도의 확대 레벨
      };
  
  var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
  
  // 마커가 표시될 위치입니다
  var markerPosition  = new daum.maps.LatLng(36.357537, 127.32399);

  // 마커를 생성합니다
  var marker = new daum.maps.Marker({
      position: markerPosition
  });
  
  // 마커가 지도 위에 표시되도록 설정합니다
  marker.setMap(map);
  
  // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
  // marker.setMap(null);
</script>
