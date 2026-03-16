@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZACONNECTIONTEST'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_ACONNECTIONTEST
  as select from ZACONNECTIONTEST
{
  key uuid as UUID,
  carrid as Carrid,
  connid as Connid,
  airport_from as AirportFrom,
  city_from as CityFrom,
  country_from as CountryFrom,
  airport_to as AirportTo,
  city_to as CityTo,
  country_to as CountryTo,
  @Semantics.user.createdBy: true
  local_create_by as LocalCreateBy,
  @Semantics.systemDateTime.createdAt: true
  local_create_at as LocalCreateAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_change_by as LocalLastChangeBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_change_att as LastChangeAtt
}
