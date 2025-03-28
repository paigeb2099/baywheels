<Screen
  id="analytics"
  _hashParams={[]}
  _searchParams={[]}
  title={null}
  urlSlug=""
>
  <SqlQueryUnified
    id="getLocations_postgres"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getLocations_postgres.sql", "string")}
    resourceDisplayName="Baywheels PostgreSQL"
    resourceName="84eee927-9750-44ce-b834-c7adc5421986"
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <Function
    id="transformer1"
    funcBody={include("../lib/transformer1.js", "string")}
  />
  <SqlQueryUnified
    id="clickLocation_postgres"
    notificationDuration={4.5}
    query={include("../lib/clickLocation_postgres.sql", "string")}
    resourceDisplayName="Baywheels PostgreSQL"
    resourceName="84eee927-9750-44ce-b834-c7adc5421986"
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="getBikes"
    query={include("../lib/getBikes.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="699ed56c-f7ba-47b0-8877-944dc4b8c210"
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="getStation"
    isMultiplayerEdited={false}
    query={include("../lib/getStation.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="699ed56c-f7ba-47b0-8877-944dc4b8c210"
    warningCodes={[]}
  />
  <RESTQuery
    id="recentMembers"
    resourceDisplayName="Memberships"
    resourceName="24646561-ff97-495b-97a1-80b419d65c77"
  />
  <SqlQueryUnified
    id="totalRides"
    notificationDuration={4.5}
    query={include("../lib/totalRides.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="699ed56c-f7ba-47b0-8877-944dc4b8c210"
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="availableBikes"
    query={include("../lib/availableBikes.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="699ed56c-f7ba-47b0-8877-944dc4b8c210"
    warningCodes={[]}
  />
  <Frame
    id="$main3"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Container
      id="container3"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle3"
          value="#### Current Stats"
          verticalAlign="center"
        />
      </Header>
      <View id="2c13b" viewKey="View 1">
        <Statistic
          id="statistic1"
          currency="USD"
          label="Total Rides"
          labelCaption="Since last week"
          positiveTrend="{{ self.value >= 0 }}"
          secondaryCurrency="USD"
          secondaryEnableTrend={true}
          secondaryFormattingStyle="percent"
          secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
          secondaryShowSeparators={true}
          secondarySignDisplay="trendArrows"
          secondaryValue="-0.05"
          showSeparators={true}
          value="{{ totalRides.data.total_rides }}"
        />
        <Statistic
          id="statistic2"
          currency="USD"
          label="Total Members"
          labelCaption="Since last week"
          positiveTrend="{{ self.value >= 0 }}"
          secondaryCurrency="USD"
          secondaryEnableTrend={true}
          secondaryFormattingStyle="percent"
          secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
          secondaryShowSeparators={true}
          secondarySignDisplay="trendArrows"
          secondaryValue={0.08}
          showSeparators={true}
          value="{{recentMembers.data.length}}"
        />
        <Statistic
          id="statistic3"
          currency="USD"
          label="Available Bikes"
          labelCaption="Right Now"
          positiveTrend="{{ self.value >= 0 }}"
          secondaryCurrency="USD"
          secondaryEnableTrend={true}
          secondaryFormattingStyle="percent"
          secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
          secondaryShowSeparators={true}
          secondarySignDisplay="trendArrows"
          secondaryValue=""
          showSeparators={true}
          value="{{ availableBikes.data.sum }}"
        />
      </View>
    </Container>
    <Container
      id="container1"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle1"
          value="#### Bike Stations"
          verticalAlign="center"
        />
      </Header>
      <View id="0a4f5" viewKey="View 1">
        <Map
          id="mapboxMap1"
          geoJson=""
          onPointSelected="getStation"
          points="{{ transformer1.value }}"
          zoom="11"
        />
      </View>
    </Container>
    <Container
      id="container2"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle2"
          value="#### Station Details"
          verticalAlign="center"
        />
      </Header>
      <View id="0a4f5" viewKey="View 1">
        <KeyValue
          id="keyValue1"
          data="{{ getStation.data }}"
          editIcon="bold/interface-edit-pencil"
          enableSaveActions={true}
          groupLayout="singleColumn"
          itemLabelPosition="top"
          labelWrap={true}
          maintainSpaceWhenHidden={true}
        >
          <Property
            id="id"
            editable="false"
            editableOptions={{}}
            format="tags"
            formatOptions={{ automaticColors: true }}
            hidden="true"
            label="ID"
          />
          <Property
            id="station_name"
            editable="false"
            editableOptions={{}}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Station Name"
            valueOverride="{{ item.toString() }}"
          />
          <Property
            id="latitude"
            editable="false"
            editableOptions={{}}
            format="tags"
            formatOptions={{ automaticColors: true }}
            hidden="true"
            label="Latitude"
          />
          <Property
            id="longitude"
            editable="false"
            editableOptions={{}}
            format="tags"
            formatOptions={{ automaticColors: true }}
            hidden="true"
            label="Longitude"
          />
          <Property
            id="address"
            editable="false"
            editableOptions={{}}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Address"
            valueOverride="{{ item.toString() }}"
          />
          <Property
            id="station_id"
            editable="false"
            editableOptions={{}}
            format="tag"
            formatOptions={{ automaticColors: true }}
            hidden="true"
            label="Station ID"
            valueOverride="{{ item.toString() }}"
          />
          <Property
            id="bikes_available"
            editable="false"
            editableOptions={{}}
            format="tags"
            formatOptions={{ automaticColors: true }}
            hidden="false"
            label="Bikes Available"
          />
          <Property
            id="rides_from_station"
            editable="false"
            editableOptions={{}}
            format="tag"
            formatOptions={{ automaticColors: true }}
            hidden="false"
            label="Rides from Station"
            valueOverride="{{ item.toString() }}"
          />
          <Property
            id="rides_to_station"
            editable="false"
            editableOptions={{}}
            format="tag"
            formatOptions={{ automaticColors: true }}
            hidden="false"
            label="Rides to Station"
            valueOverride="{{ item.toString() }}"
          />
          <Property
            id="docking_points"
            editable="false"
            editableOptions={{}}
            format="tag"
            formatOptions={{ automaticColors: true }}
            hidden="false"
            label="Docking Points"
            valueOverride="{{ item.toString() }}"
          />
          <Property
            id="last_updated"
            editable="false"
            editableOptions={{}}
            format="datetime"
            formatOptions={{}}
            hidden="false"
            label="Last Updated"
            valueOverride="{{ item.toString() }}"
          />
        </KeyValue>
      </View>
    </Container>
    <Button id="button2" text="Rider Logs" />
    <Button id="button3" text="Bike Locations" />
    <Button id="button1" text="Maintenance Request" />
  </Frame>
</Screen>
