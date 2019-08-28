import "bootstrap";

const formSubmit = document.querySelector('.modal-submit')

formSubmit.addEventListener("click", (event) => {
  event.preventDefault();

  // Booking form
  const form = event.currentTarget.form

  // Form inputs
  // start date
  // end date
  // Booking price???

  debugger

  // Get distance in days
  // Multiply by price

  // Modal Displays
  const startDate = document.querySelector('#booking-start-date')
  const endDate = document.querySelector('#booking-end-date')
  const totalPrice = document.querySelector('#booking-total-price')

  // Display Overrides
  startDate.innerText = "startDate";
  endDate.innerText = "endDate";
  totalPrice.innerText = "totalPrice";

  // Open modal
  $('#confirmBooking').modal()
});


// Set change behaviour on both

// Behaviour
// check if both are filled
// calculate the price
// display price


