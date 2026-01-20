@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'ds'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z15_TravelWithCustomer
  as select from Z15_Customer                     as c

    inner join   Z15_Travel                       as t
      on t.CustomerId = c.CustomerId

    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                   p_domain_name : '/DMO/STATUS') as s
      on s.value_low = t.Status and s.language = $session.system_language

{
  key t.TravelId,

      t.AgencyId,
      t.BeginDate,
      t.EndDate,
      cast(dats_days_between(t.BeginDate, t.EndDate) + 1 as abap.int4) as Duration,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      t.BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'

      currency_conversion(amount             => t.TotalPrice,
                          source_currency    => t.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => $session.system_date)  as TotalPrice,

      cast('EUR' as /dmo/currency_code)                                as CurrencyCode,

      @EndUserText.label: 'Status Text'
      @EndUserText.quickInfo: 'Status Text'
      s.text                                                           as StatusText,

      t.Description,
      c.CustomerId,

      @EndUserText.label: 'Customer Name'
      @EndUserText.quickInfo: 'Customer Name'
      case when c.Title is initial then concat_with_space(c.FirstName, c.LastName, 1)
           else concat_with_space(concat_with_space(c.Title, c.FirstName, 1), c.LastName, 1)
      end                                                               as CustomerName,

      c.FirstName,
      c.LastName,
      c.Title,

      c.Street,
      c.PostalCode,
      c.City
}

where c.CountryCode = 'DE'
