<Screen
  id="page1"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title="Page 1"
  urlSlug=""
>
  <SqlQueryUnified
    id="getUsers"
    functionDescription={null}
    functionParameters={null}
    isFunction={false}
    query={include("../lib/getUsers.sql", "string")}
    resourceDisplayName="Baywheels PostgreSQL"
    resourceName="84eee927-9750-44ce-b834-c7adc5421986"
    resourceTypeOverride=""
    warningCodes={[]}
    workflowRunExecutionType="sync"
  />
  <RESTQuery
    id="mockRestQuery"
    _additionalScope={[]}
    actionType=""
    bulkUpdatePrimaryKey=""
    dataArray={[]}
    databaseHostOverride=""
    databaseNameOverride=""
    databasePasswordOverride=""
    databaseRoleOverride=""
    databaseUsernameOverride=""
    databaseWarehouseOverride=""
    doNotThrowOnNoOp={false}
    editorMode="sql"
    enableBulkUpdates={false}
    filterBy=""
    recordId=""
    records=""
    resourceDisplayName="Mock REST API"
    resourceName="dd0ffca4-0a8b-4227-9215-e847fc1e920e"
    resourceTypeOverride=""
    shouldEnableBatchQuerying={false}
    shouldUseLegacySql={false}
    tableName=""
  />
  <SqlQueryUnified
    id="updateUser"
    actionType="UPDATE_BY"
    changesetIsObject={true}
    changesetObject="{{ form1.data }}"
    editorMode="gui"
    filterBy={
      '[{"key":"id","value":"{{ table1.selectedRow.id }}","operation":"="}]'
    }
    functionDescription={null}
    functionParameters={null}
    isFunction={false}
    notificationDuration={4.5}
    resourceDisplayName="Baywheels PostgreSQL"
    resourceName="84eee927-9750-44ce-b834-c7adc5421986"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    tableName="sample_users"
    updateSetValueDynamically={true}
    workflowRunExecutionType="sync"
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getUsers"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </SqlQueryUnified>
  <JavascriptQuery
    id="query7"
    notificationDuration={4.5}
    query={include("../lib/query7.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    type="main"
  >
    <Switch id="switch1" label="Theme mode" value="">
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="query7"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Switch>
    <Include src="./container6.rsx" />
    <Form
      id="form1"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      initialData="{{ table1.selectedRow }}"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      scroll={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text id="formTitle1" value="#### Update User" verticalAlign="center" />
      </Header>
      <Body>
        <TextInput
          id="nameInput"
          formDataKey="name"
          label="Name"
          labelPosition="top"
          placeholder="Enter value"
          required={true}
        />
        <TextInput
          id="emailInput"
          formDataKey="email"
          iconBefore="bold/mail-send-envelope"
          label="Email"
          labelPosition="top"
          patternType="email"
          placeholder="you@example.com"
          required={true}
        />
        <DateTime
          id="signupDateInput"
          dateFormat="MMM d, yyyy"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          formDataKey="signup_date"
          iconBefore="bold/interface-calendar"
          label="Signup date"
          labelPosition="top"
          minuteStep={15}
          required={true}
          value="{{ new Date() }}"
        />
        <Select
          id="roleInput"
          emptyMessage="No options"
          formDataKey="role"
          itemMode="static"
          label="Role"
          labelPosition="top"
          labels={null}
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
          values={null}
        >
          <Option id="0f2b5" value="Editor" />
          <Option id="698e9" value="Admin" />
          <Option id="4a64d" value="Viewer" />
        </Select>
        <Checkbox
          id="enabledInput"
          formDataKey="enabled"
          label="Enabled"
          labelWidth="100"
          required={true}
        />
      </Body>
      <Footer>
        <Button
          id="formButton1"
          allowWrap={true}
          submit={true}
          submitTargetId="form1"
          text="Submit"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="updateUser"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
    <Button id="button6" text="Contact User" />
    <Button id="button7" text="Open Issue" />
  </Frame>
</Screen>
