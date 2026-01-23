@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

@Metadata.allowExtensions: true

@Search.searchable: true

define root view entity ZC_15_MovieTP
  provider contract transactional_query
  as projection on ZR_15_MovieTP

//  association to parent ZI_15_Rating as _Ratings
//    on $projection.MovieUUID = _Ratings.MovieUuid

{
  key MovieUUID,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,

@ObjectModel.text.element: [ 'GenreText' ]
@Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_15_GENREVH', element: 'Genre' } } ]
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageURL,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,


      _AverageRating.AverageRating,
      _AverageRating.AverageRatingCriticality,
      
      _GenreText.GenreText,

      _Ratings : redirected to composition child ZC_15_RATINGTP
}
