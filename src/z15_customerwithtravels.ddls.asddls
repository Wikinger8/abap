@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'gbd'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z15_CustomerWithTravels
  as select from Z15_Customer

  association [0..*] to Z15_Travel as _Travels on $projection.CustomerId = _Travels.CustomerId

{
  key CustomerId,

      FirstName,
      LastName,
      Title,
      Street,
      PostalCode,
      City,
      CountryCode,

      _Travels
}

where CountryCode = 'DE'
