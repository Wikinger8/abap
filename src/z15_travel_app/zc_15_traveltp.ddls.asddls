@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel die genutzten Elemente aus ZR'

@Metadata.allowExtensions: true

@Search.searchable: true

define root view entity ZC_15_TravelTP
provider contract transactional_query
  as projection on ZR_15_TravelTP

{
  key TravelId,

      AgencyId,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_15_CustomerVH', element: 'CustomerId' } } ]
      CustomerId,

      BeginDate,
      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_CURRENCYSTDVH', element: 'Currency' } } ]
      CurrencyCode,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Description,

      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      // Transient Data
      StatusCriticality,
      CustomerName,

      _Bookings : redirected to composition child ZC_15_BookingTP
}
