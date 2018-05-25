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







const mapElement = document.getElementById('map');

if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
  });
  map.setStyle('map_style');

  const markers = JSON.parse(mapElement.dataset.markers);

  markers.forEach(function(element, index, theArray) {

      const tasks = JSON.parse(mapElement.dataset.tasks)
      const key = element.lat + ',' + element.lng;
      const task = tasks[key]

      const divS = "<div class='overlay'><ul>"
      const divE = "</ul></div>"
      const companyName = "<h2>Company: " + task.name + " </h2>"
      const companyAddress = "<a>Address: " + task.address + " </a>"
      const companyPrice = "<a>Price: " + task.final_price + "DKK </a>"
      const content_string = divS + companyName + companyAddress + companyPrice + divE

      element['infoWindow'] = { content: content_string };
      var marker = map.createMarker(element);

      var mark = map.addMarker(element);
     theArray[index] = element;

  });


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














