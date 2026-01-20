@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'fd'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z15_Demo02
  as select from /dmo/connection

  association [1..1] to /dmo/carrier as _Carrier
    on $projection.CarrierId = _Carrier.carrier_id

  association [0..*] to /dmo/flight  as _Flights
    on  _Flights.carrier_id    = $projection.CarrierId
    and _Flights.connection_id = $projection.ConnectionId

{
  key /dmo/connection.carrier_id      as CarrierId,
  key connection_id   as ConnectionId,
      airport_from_id as AirportFromId,
      airport_to_id   as AirportToId,
      
      // Associations
      _Carrier,
      _Flights
}

//where c.carrier_id = 'LH' and c.connection_id = '0400'
