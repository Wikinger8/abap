@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'dgdhd'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z15_Demo03
  as select from /dmo/connection as c

    inner join   /dmo/flight     as f on c.carrier_id = f.carrier_id and c.connection_id = f.connection_id

{
  key c.carrier_id                                                   as CarrierId,
  key c.connection_id                                                as ConnectionId,


      'Hello World'                                                  as CharacterLiteral,

      42                                                             as NumberLiteral,
      0.1                                                            as Fltp,

      @EndUserText.label: 'Carrier Id'
      @EndUserText.quickInfo: 'Carrier Id'
      'LH '                                                          as Char3,

      cast('LH ' as /dmo/carrier_id)                                 as CarrierId2,


      f.seats_max - f.seats_occupied                                 as FreeSeats,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      f.price                                                        as OldPrice,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      f.price * 2                                                    as DoublePrice,

      cast(f.price as abap.fltp) * 1.1                               as NewPrice,
      cast(f.price as abap.dec(16,2)) * cast('1.1' as abap.dec(4,1)) as NewPrice2,
      f.currency_code                                                as CurrencyCode,
      f.seats_occupied                                               as OccupiedSeats,
      f.seats_max                                                    as MaxSeats,
      f.seats_occupied / f.seats_max                                 as OccupancyRate,

      c.distance                                                     as Distance,
      c.distance_unit                                                as DistanceUnit,

      case when c.distance < 1000 then 'Kurzstreckenflug'
           when c.distance < 5000 then 'Mittelstreckenflug'
           else 'Langstreckenflug' end                               as DistanceText,

      case f.currency_code when 'EUR' then 'Euro'
                           when 'SGD' then 'Singapur Dollar'
                           when 'USD' then 'Amerikanischer Dollar'
                           else 'was anderes' end                    as CurrencyCodeText,
                           
                           
                           
                           
                           division(f.seats_max, f.seats_occupied, 2) as OccupancyRate2,
                           
                           
                           length('   ') as SSS,
                           length('X  ') as XSS,
                           length(' X ') as SXS,
                           length('  X') as SSX,
                           
      @Semantics.amount.currencyCode: 'CurrencyCode'
                           currency_conversion(amount => f.price,
                           source_currency => f.currency_code,
                           target_currency => cast('EUR' as abap.cuky),
                           exchange_rate_date => f.flight_date ,
                           error_handling => 'SET_TO_NULL') as ConvertedPrice
                           
                           
}

where c.carrier_id = 'LH'
