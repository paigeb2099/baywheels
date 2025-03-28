<Screen id="issues" _hashParams={[]} _searchParams={[]} title={null} urlSlug="">
  <RESTQuery
    id="getIssues"
    resourceDisplayName="Mock API 2"
    resourceName="ea2cad6d-9918-4171-9d1f-c69e2c5a2851"
  />
  <RESTQuery
    id="getMembers"
    resourceDisplayName="Mock REST API"
    resourceName="dd0ffca4-0a8b-4227-9215-e847fc1e920e"
  />
  <RESTQuery
    id="updateIssue"
    body={
      '[{"key":"email","value":"{{ textInput4.value }}","operation":"text"},{"key":"status","value":"{{ select1.value }}","operation":"text"}]'
    }
    bodyType="form-data"
    headers="[]"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query="{{ table2.selectedRow.id }}"
    resourceDisplayName="Mock API 2"
    resourceName="ea2cad6d-9918-4171-9d1f-c69e2c5a2851"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="PATCH"
  >
    <Event
      event="success"
      method="trigger"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { onSuccess: null },
                { onFailure: null },
                { additionalScope: null },
              ],
            },
          },
        ],
      }}
      pluginId="getIssues"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <Frame
    id="$main2"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Statistic
      id="statistic6"
      currency="USD"
      label="New Issues Today"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue=""
      showSeparators={true}
      value="10"
    />
    <Statistic
      id="statistic4"
      currency="USD"
      label="Total Open Issues"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue=""
      showSeparators={true}
      value="{{ getIssues.data.length }}"
    />
    <Statistic
      id="statistic5"
      currency="USD"
      label="Issues Resolved Today"
      positiveTrend="{{ self.value >= 0 }}"
      secondaryCurrency="USD"
      secondaryEnableTrend={true}
      secondaryFormattingStyle="percent"
      secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
      secondaryShowSeparators={true}
      secondarySignDisplay="trendArrows"
      secondaryValue=""
      showSeparators={true}
      value="35"
    />
    <Container
      id="container4"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle4"
          value="#### Issues Panel"
          verticalAlign="center"
        />
      </Header>
      <View id="a7116" viewKey="View 1">
        <Table
          id="table2"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ getIssues.data }}"
          defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          showBorder={true}
          showFooter={true}
          showHeader={true}
          toolbarPosition="bottom"
        >
          <Column
            id="e7f24"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="id"
            label="ID"
            placeholder="Enter value"
            position="center"
            size={31.546875}
            summaryAggregationMode="none"
          />
          <Column
            id="ca9af"
            alignment="left"
            format="link"
            formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
            groupAggregationMode="none"
            key="email"
            label="Email"
            position="center"
            size={178.875}
            summaryAggregationMode="none"
          />
          <Column
            id="8c678"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="status"
            label="Status"
            placeholder="Select option"
            position="center"
            size={167.390625}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="bd2e0"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="dates"
            label="Dates"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <ToolbarButton
            id="1a"
            icon="bold/interface-text-formatting-filter-2"
            label="Filter"
            type="filter"
          />
          <ToolbarButton
            id="3c"
            icon="bold/interface-download-button-2"
            label="Download"
            type="custom"
          >
            <Event
              event="clickToolbar"
              method="exportData"
              pluginId="table2"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
          <ToolbarButton
            id="4d"
            icon="bold/interface-arrows-round-left"
            label="Refresh"
            type="custom"
          >
            <Event
              event="clickToolbar"
              method="refresh"
              pluginId="table2"
              type="widget"
              waitMs="0"
              waitType="debounce"
            />
          </ToolbarButton>
        </Table>
      </View>
    </Container>
    <Form
      id="form2"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      initialData="{{ table2.selectedRow }}"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      scroll={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle2"
          value="#### Update Issue"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <NumberInput
          id="numberInput1"
          currency="USD"
          formDataKey="id"
          inputValue={0}
          label="ID"
          labelPosition="top"
          placeholder="Enter value"
          showSeparators={true}
          showStepper={true}
          value={0}
        />
        <TextInput
          id="textInput3"
          formDataKey="dates"
          label="Dates"
          labelPosition="top"
          placeholder="Enter value"
        />
        <TextInput
          id="textInput4"
          formDataKey="email"
          iconBefore="bold/mail-send-envelope"
          label="Email"
          labelPosition="top"
          patternType="email"
          placeholder="you@example.com"
        />
        <Select
          id="select1"
          data="{{ getIssues.data }}"
          emptyMessage="No options"
          formDataKey="status"
          label="Status"
          labelPosition="top"
          labels="{{ item.status }}"
          overlayMaxHeight={375}
          placeholder="Select an option"
          showSelectionIndicator={true}
          values="{{ item.id }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton2"
          submit={true}
          submitTargetId="form2"
          text="Submit"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="updateIssue"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
    <Container
      id="container5"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle5"
          value="#### Issue ID {{ table2.selectedRow.id }}"
          verticalAlign="center"
        />
      </Header>
      <View id="a7116" viewKey="View 1">
        <KeyValue
          id="keyValue2"
          data="{{table2.selectedRow}}"
          editIcon="bold/interface-edit-pencil"
          enableSaveActions={true}
          itemLabelPosition="top"
          labelWrap={true}
        >
          <Property
            id="id"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            hidden="true"
            label="Issue ID"
          />
          <Property
            id="email"
            editable="false"
            editableOptions={{}}
            format="link"
            formatOptions={{ showUnderline: "hover" }}
            hidden="false"
            label="Email"
          />
          <Property
            id="status"
            editable="false"
            editableOptions={{}}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Status"
          />
          <Property
            id="dates"
            editable="false"
            editableOptions={{}}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Submitted On"
          />
        </KeyValue>
      </View>
    </Container>
    <Button id="button4" text="Contact User" />
    <Button id="button5" text="Escalate Issue" />
  </Frame>
</Screen>
