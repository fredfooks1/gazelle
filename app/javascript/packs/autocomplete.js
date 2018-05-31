function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var taskFirstLocation = document.getElementById('task_first_location');

    if (taskFirstLocation) {
      var autocomplete = new google.maps.places.Autocomplete(taskFirstLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(taskFirstLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });


  document.addEventListener("DOMContentLoaded", function() {
      var taskSecondLocatoin = document.getElementById('task_second_location');

      if (taskSecondLocatoin) {
        var autocomplete = new google.maps.places.Autocomplete(taskSecondLocatoin, { types: [ 'geocode' ] });
        google.maps.event.addDomListener(taskSecondLocatoin, 'keydown', function(e) {
          if (e.key === "Enter") {
            e.preventDefault(); // Do not submit the form on Enter.
          }
        });
      }
    });

  }

export { autocomplete };
