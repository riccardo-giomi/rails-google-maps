import { Controller } from "@hotwired/stimulus"
import { getBrowserLocation } from 'custom/maps_utils'

export default class extends Controller {
  static targets = ["search", "map", "latitude", "longitude"]

  connect() {
    if(typeof google != "undefined") this.initializeMap()
  }

  // Common entry point after Google Map initialization and controller
  // initialization. The last one of the two that is ready calls this to
  // synchronize with the other.
  initializeMap() {
    this.startPosition().then(() => {
      this.map()
      this.marker()
      this.autocomplete()
    })
  }

  async startPosition() {
    if(this._map == undefined) {
      if(this.latitudeTarget.value !== "" && this.longitudeTarget.value !== "") return
      console.log(this.latitudeTarget.value)
      console.log(this.longitudeTarget.value)

      const coordinates = await getBrowserLocation()
      console.log(coordinates)
      this.latitudeTarget.value = coordinates.latitude
      this.longitudeTarget.value = coordinates.longitude
    }
  }

  map() {
    if(this._map == undefined) {
      this._map = new google.maps.Map(this.mapTarget, {
        center: new google.maps.LatLng(
          this.latitudeTarget.value,
          this.longitudeTarget.value
        ),
        zoom: 17
      })
    }
    return this._map
  }

  marker() {
    if (this._marker == undefined) {
      this._marker = new google.maps.Marker({
        map: this.map(),
        anchorPoint: new google.maps.Point(0,0)
      })
      let mapLocation = {
        lat: parseFloat(this.latitudeTarget.value),
        lng: parseFloat(this.longitudeTarget.value)
      }
      this._marker.setPosition(mapLocation)
      this._marker.setVisible(true)
    }
    return this._marker
  }

  autocomplete() {
    if (this._autocomplete == undefined) {
      this._autocomplete = new google.maps.places.Autocomplete(this.searchTarget)
      this._autocomplete.bindTo('bounds', this.map())
      this._autocomplete.setFields(['geometry', 'icon', 'name'])
      this._autocomplete.addListener('place_changed', this.locationChanged.bind(this))
    }
    return this._autocomplete
  }

  locationChanged() {
    let place = this.autocomplete().getPlace()

    if (!place.geometry) {
      // User entered the name of a Place that was not suggested and
      // pressed the Enter key, or the Place Details request failed.
      window.alert("No details available for input: '" + place.name + "'");
      return;
    }

    this.map().fitBounds(place.geometry.viewport)
    this.map().setCenter(place.geometry.location)
    this.marker().setPosition(place.geometry.location)
    this.marker().setVisible(true)

    this.latitudeTarget.value = place.geometry.location.lat()
    this.longitudeTarget.value = place.geometry.location.lng()
  }

  disableEventOnEnter(e) {
    if (e.key == "Enter") { e.preventDefault() }
  }
}
