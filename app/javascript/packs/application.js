import "bootstrap";
import { setPricing } from "_calculate_booking_price";

var bookingStartDate = document.querySelector('#booking_start_on')
var bookingEndDate = document.querySelector('#booking_end_on')

bookingStartDate.addEventListener("change", setPricing);
bookingEndDate.addEventListener("change", setPricing);
