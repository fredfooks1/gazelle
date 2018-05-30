import GMaps from 'gmaps/gmaps.js';

const styles = [
    {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [
            {
                "hue": "#FFA800"
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "hue": "#679714"
            },
            {
                "saturation": 33.4
            },
            {
                "lightness": -25.4
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
            {
                "hue": "#53FF00"
            },
            {
                "saturation": -73
            },
            {
                "lightness": 40
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "all",
        "stylers": [
            {
                "hue": "#FBFF00"
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "all",
        "stylers": [
            {
                "hue": "#00FFFD"
            },
            {
                "lightness": 30
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "hue": "#00BFFF"
            },
            {
                "saturation": 6
            },
            {
                "lightness": 8
            },
            {
                "gamma": 1
            }
        ]
    }
];

const mapElement = document.getElementById('company-show-map');

if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const endPoints = JSON.parse(mapElement.dataset.end_points);
  console.log(endPoints)
  console.log("company_map")
  const map = new GMaps({ el: '#company-show-map', lat: 55.6761, lng:  12.5683 });
  map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
  });
  map.setStyle('map_style');

  const markers = JSON.parse(mapElement.dataset.markers);
  map.addMarkers(markers);
  if (Object.keys(endPoints).length === 3){
    addRoute(endPoints.origin, endPoints.waypoint, map);
    addRoute(endPoints.waypoint, endPoints.destination, map);
  } else if (endPoints.waypoint) {
      addRoute(endPoints.waypoint, endPoints.destination, map);
  } else if (endPoints.origin) {
      addRoute(endPoints.origin, endPoints.destination, map);
  }

  if (markers.length === 0) {
    map.setCenter(55.6761, 12.5683);
    map.setZoom(14);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}


function addRoute (routeStart, routeEnd, map){
    map.drawRoute({
      origin: routeStart,
      destination: routeEnd,
      travelMode: 'driving',
      strokeColor: '#41E8C0',
      strokeOpacity: 0.9,
      strokeWeight: 6
    })

}











