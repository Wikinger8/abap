@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'd'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z15_CustomerKPIs
with parameters P_City : /dmo/city
as select from Z15_TravelWithCustomer
{
key CustomerId as CustomerId,
CustomerName as CustomerName,
Street as Street,
PostalCode as PostalCode,
City as City,
@Semantics.amount.currencyCode: 'CurrencyCode'
sum(TotalPrice + BookingFee) as TotalRevenue,
CurrencyCode as CurrencyCode,
avg(Duration as abap.dec(16,2)) as AverageDuration,
count(distinct AgencyId)  as NumberOfDifferentAgencys
  
}
where City  = $parameters.P_City

group by
  CustomerId,
  CustomerName,
  Street,
  PostalCode,
  City,
  CurrencyCode
