@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Booking'


define view entity ZR_15_BookingTP
  as select from ZI_15_Booking

  association to parent ZR_15_TravelTP as _Travel on $projection.TravelId = _Travel.TravelId

{
  key TravelId,
  key BookingId,

      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,

      FlightPrice,
      CurrencyCode,

      _Travel
}
