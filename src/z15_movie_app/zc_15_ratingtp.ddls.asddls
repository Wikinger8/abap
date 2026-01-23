@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'
@Metadata.allowExtensions: true
define view entity ZC_15_RATINGTP as projection on ZR_15_RatingTP
{
  key RatingUuid,
  key MovieUuid,
  UserName,
  Rating,
  RatingDate,


 
  
  /* Associations */
  _Movies : redirected to parent ZC_15_MovieTP
}
