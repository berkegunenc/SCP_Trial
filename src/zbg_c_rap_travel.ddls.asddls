@EndUserText.label: 'Travel BO Projection View'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ZBG_C_RAP_TRAVEL
  as projection on ZBG_I_RAP_TRAVEL as Travel
{
      //ZBG_I_RAP_TRAVEL
      @Search.defaultSearchElement: true
  key TravelUUID,
      @Search.defaultSearchElement: true
      TravelID,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency', element: 'AgencyID' } }]
      //@ObjectModel.text.element: ['AgencyName']
      //@Consumption.valueHelpDefinition: [{ entity : {name: 'ZBG_CE_RAP_AGENCY', element: 'AgencyId' } }]
      @Search.defaultSearchElement: true
      AgencyID,
      //_Agency.Name       as AgencyName,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID' } }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerID,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency' } }]
      CurrencyCode,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #MEDIUM
      Description,
      TravelStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      
      /* Associations */
      //ZBG_I_RAP_TRAVEL
      _Agency,
      _Booking : redirected to composition child ZBG_C_RAP_BOOKING,
      _Currency,
      _Customer
}
