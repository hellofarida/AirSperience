const setPricing = (event) => {

    var bookingStartDate = document.querySelector('#booking_start_on')
    var bookingEndDate = document.querySelector('#booking_end_on')
    var experiencePrice = document.querySelector('#booking_experience_price').value
    var totalPrice = document.querySelector('.booking-total-price')

    if (bookingStartDate.value && bookingEndDate.value !== '') {

      // Turn inputs into dates
      const startDate = new Date(bookingStartDate.value);
      const endDate = new Date(bookingEndDate.value);

      const seconds = (endDate.getTime() - startDate.getTime()) / 1000
      const days = Math.floor(seconds / (3600*24));

      totalPrice.innerText = `Total: $${days * experiencePrice}`

    } else {
      console.log('Both fields need to be filled in!');
    }
}

export { setPricing };
