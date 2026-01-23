@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'
define view entity ZR_15_RatingTP 
as select from ZI_15_Rating


  
  association to parent ZR_15_MovieTP as _Movies
    on $projection.MovieUuid = _Movies.MovieUUID
{
  key RatingUuid,
  key MovieUuid,
  UserName,
  Rating,
  RatingDate,
  
  
  
  _Movies
}
