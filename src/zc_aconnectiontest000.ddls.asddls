@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZACONNECTIONTEST'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_ACONNECTIONTEST000
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_ACONNECTIONTEST
  association [1..1] to ZR_ACONNECTIONTEST as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
  Carrid,
  Connid,
  AirportFrom,
  CityFrom,
  CountryFrom,
  AirportTo,
  CityTo,
  CountryTo,
  @Semantics: {
    User.Createdby: true
  }
  LocalCreateBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  LocalCreateAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LocalLastChangeBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangeAtt,
  _BaseEntity
}
