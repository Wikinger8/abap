@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'f'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_15_GenreVH as select distinct from DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                            p_domain_name : 'ZABAP_GENRE')
{
@UI.hidden: true
   key domain_name,
   @UI.hidden: true
  key value_position,
  @UI.hidden: true
  key language,

      @EndUserText.label: 'Genre'
      @EndUserText.quickInfo: 'Genre'
      value_low       as Genre,

@EndUserText.label: 'Genre Text'
      @EndUserText.quickInfo: 'Genre Text'
      text            as GenreText
}

where language = $session.system_language
