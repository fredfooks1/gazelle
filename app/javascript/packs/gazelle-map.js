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





const mapElement = document.getElementById('map-gazelle');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map-gazelle', lat: 0, lng: 0 });
  map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
  });
  map.setStyle('map_style');


  const markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach(function(element, index, theArray) {
      // mark.addListener('click', toggleBounce);

      //parse the data for the info window
      const gazelle_runners = JSON.parse(mapElement.dataset.gazelles)

      const key = element.lat + ',' + element.lng;
      const gazelle_runner = gazelle_runners[key]

      // content for the info-window
      const divS = "<div class='overlay'>"
      const divE = "</div>"
      const GazelleRunnerName = "<a> " + gazelle_runner.first_name + " " + gazelle_runner.last_name + " </a>"

      const content_string = divS + GazelleRunnerName  + divE

      // Add info-windowws
      element['infoWindow'] = { content: content_string };
      theArray[index] = element;
      const marker = map.createMarker(element);
      const mark = map.addMarker(element);


       const company_marker = JSON.parse(mapElement.dataset.company);
       map.addMarker(company_marker);

      // Add bounce
       function toggleBounce() {
        if (mark.getAnimation() !== null) {
          mark.setAnimation(null);
        } else {
          mark.setAnimation(google.maps.Animation.BOUNCE);
        }
      }

  });

  if (markers.length === 0) {
    map.setCenter(55.6761, 12.5683);
    map.setZoom(14);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    // map.fitLatLngBounds(markers);
    map.setCenter(55.6761, 12.5683);
    map.setZoom(14);
  }
}









