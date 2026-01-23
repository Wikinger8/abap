@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZR_15_MovieTP as select from ZI_15_Movie

association [0..1] to ZI_15_AverageRating as _AverageRating on $projection.MovieUUID = _AverageRating.MovieUuid
  association [0..1] to ZI_15_GenreText as _GenreText on $projection.Genre = _GenreText.Genre
  composition [0..*] of ZR_15_RatingTP as _Ratings
{
  key MovieUUID,
  Title,
  @ObjectModel.text.element: [ 'Genre' ]
  Genre,
  
  PublishingYear,
  RuntimeInMin,
  @Semantics.imageUrl: true
  ImageURL,
  CreatedAt,
  CreatedBy,
  LastChangedAt,
  LastChangedBy,
 
  

  
  
  _Ratings,
  _AverageRating,
  _GenreText
  
}
