
    create table JIAccessEvent (
        id number not null,
        user_id number not null,
        event_date timestamp not null,
        resource_id number not null,
        updating number(1) not null,
        primary key (id)
    );

    create table JIBeanDatasource (
        id number not null,
        beanName varchar2(100) not null,
        beanMethod varchar2(100),
        primary key (id)
    );

    create table JIContentResource (
        id number not null,
        data blob,
        file_type varchar2(20),
        primary key (id)
    );

    create table JICustomDatasource (
        id number not null,
        serviceClass varchar2(250) not null,
        primary key (id)
    );

    create table JICustomDatasourceProperty (
        ds_id number not null,
        value varchar2(1000),
        name varchar2(100) not null,
        primary key (ds_id, name)
    );

    create table JIDataType (
        id number not null,
        type number,
        maxLength number,
        decimals number,
        regularExpr varchar2(255),
        minValue blob,
        maxValue blob,
        strictMin number(1),
        strictMax number(1),
        primary key (id)
    );

    create table JIFileResource (
        id number not null,
        data blob,
        file_type varchar2(20),
        reference number,
        primary key (id)
    );

    create table JIInputControl (
        id number not null,
        type number,
        mandatory number(1),
        readOnly number(1),
        visible number(1),
        data_type number,
        list_of_values number,
        list_query number,
        query_value_column varchar2(200),
        defaultValue blob,
        primary key (id)
    );

    create table JIInputControlQueryColumn (
        input_control_id number not null,
        query_column varchar2(200) not null,
        column_index number not null,
        primary key (input_control_id, column_index)
    );

    create table JIJNDIJdbcDatasource (
        id number not null,
        jndiName varchar2(100) not null,
        timezone varchar2(100),
        primary key (id)
    );

    create table JIJdbcDatasource (
        id number not null,
        driver varchar2(100) not null,
        password varchar2(100),
        connectionUrl varchar2(500),
        username varchar2(100),
        timezone varchar2(100),
        primary key (id)
    );

    create table JIListOfValues (
        id number not null,
        primary key (id)
    );

    create table JIListOfValuesItem (
        id number not null,
        label varchar2(255),
        value blob,
        idx number not null,
        primary key (id, idx)
    );

    create table JILogEvent (
        id number not null,
        occurrence_date date not null,
        event_type number not null,
        component varchar2(100),
        message varchar2(250) not null,
        resource_uri varchar2(250),
        event_text varchar2(4000),
        event_data blob,
        event_state number,
        userId number,
        primary key (id)
    );

    create table JIMondrianConnection (
        id number not null,
        reportDataSource number,
        mondrianSchema number,
        primary key (id)
    );

    create table JIMondrianXMLADefinition (
        id number not null,
        catalog varchar2(100) not null,
        mondrianConnection number,
        primary key (id)
    );

    create table JIObjectPermission (
        id number not null,
        uri varchar2(250) not null,
        recipientobjectclass varchar2(250),
        recipientobjectid number,
        permissionMask number not null,
        primary key (id)
    );

    create table JIOlapClientConnection (
        id number not null,
        primary key (id)
    );

    create table JIOlapUnit (
        id number not null,
        olapClientConnection number,
        mdx_query varchar2(2000) not null,
        view_options blob,
        primary key (id)
    );

    create table JIQuery (
        id number not null,
        dataSource number,
        query_language varchar2(40) not null,
        sql_query varchar2(2000) not null,
        primary key (id)
    );

    create table JIProfileAttribute (
        id number not null,
        attrName varchar2(255) not null,
        attrValue varchar2(255) not null,
        principalobjectclass varchar2(255) not null,
        principalobjectid number not null,
        primary key (id)
    );

    create table JIReportJob (
        id number not null,
        version number not null,        
	owner number not null,
        label varchar2(100) not null,
        description varchar2(2000),
        report_unit_uri varchar2(250) not null,
        job_trigger number not null,
        base_output_name varchar2(100) not null,
        output_locale varchar2(20),
        content_destination number,
        mail_notification number,
        primary key (id)
    );

    create table JIReportJobCalendarTrigger (
        id number not null,
        minutes varchar2(200) not null,
        hours varchar2(80) not null,
        days_type number not null,
        week_days varchar2(20),
        month_days varchar2(100),
        months varchar2(40) not null,
        primary key (id)
    );

    create table JIReportJobMail (
        id number not null,
        version number not null,
        subject varchar2(100) not null,
        message varchar2(2000) not null,
        send_type number not null,
        skip_empty number(1) not null,
        primary key (id)
    );

    create table JIReportJobMailRecipient (
        destination_id number not null,
        recipient_type number not null,
        address varchar2(100) not null,
        recipient_idx number not null,
        primary key (destination_id, recipient_idx)
    );

    create table JIReportJobOutputFormat (
        report_job_id number not null,
        output_format number not null,
        primary key (report_job_id, output_format)
    );

    create table JIReportJobParameter (
        job_id number not null,
        parameter_value blob,
        parameter_name varchar2(100) not null,
        primary key (job_id, parameter_name)
    );

    create table JIReportJobRepoDest (
        id number not null,
        version number not null,
        folder_uri varchar2(250) not null,
        sequential_filenames number(1) not null,
        overwrite_files number(1) not null,
        output_description varchar2(250),
        timestamp_pattern varchar2(250),
        primary key (id)
    );

    create table JIReportJobSimpleTrigger (
        id number not null,
        occurrence_count number not null,
        recurrence_interval number,
        recurrence_interval_unit number,
        primary key (id)
    );

    create table JIReportJobTrigger (
        id number not null,
        version number not null,
        timezone varchar2(40),
        start_type number not null,
        start_date date,
        end_date date,
        primary key (id)
    );

    create table JIReportUnit (
        id number not null,
        reportDataSource number,
        query number,
        mainReport number,
        controlrenderer varchar2(100),
        reportrenderer varchar2(100),
        promptcontrols number(1),
        controlslayout number,
        primary key (id)
    );

    create table JIReportUnitInputControl (
        report_unit_id number not null,
        input_control_id number not null,
        control_index number not null,
        primary key (report_unit_id, control_index)
    );

    create table JIReportUnitResource (
        report_unit_id number not null,
        resource_id number not null,
        resource_index number not null,
        primary key (report_unit_id, resource_index)
    );

    create table JIRepositoryCache (
        id number not null,
        uri varchar2(250) not null,
        cache_name varchar2(20) not null,
        data blob,
        version number not null,
        version_date date not null,
        item_reference number,
        primary key (id),
        unique (uri, cache_name)
    );

    create table JIResource (
        id number not null,
        version number not null,
        name varchar2(100) not null,
        parent_folder number not null,
        childrenFolder number,
        label varchar2(100) not null,
        description varchar2(250),
        creation_date date not null,
        update_date date not null,
        primary key (id),
        unique (name, parent_folder)
    );

    create table JIResourceFolder (
        id number not null,
        version number not null,
        uri varchar2(250) not null,
        hidden number(1),
        name varchar2(100) not null,
        label varchar2(100) not null,
        description varchar2(250),
        parent_folder number,
        creation_date date not null,
        update_date date not null,
        primary key (id),
        unique (uri)
    );

    create table JITenant (
        id number not null,
        tenantId varchar2(100) not null,
        tenantAlias varchar2(100) not null,
        parentId number,
        tenantName varchar2(100) not null,
        tenantDesc varchar2(250),
        tenantNote varchar2(250),
        tenantUri varchar2(250) not null,
        tenantFolderUri varchar2(250) not null,
        theme varchar2(250),
        primary key (id),
        unique (tenantId)
    );


    create table JIRole (
        id number not null,
        rolename varchar2(100) not null unique,
        tenantId number not null,
        externallyDefined number(1),
        primary key (id),
        unique (rolename, tenantId)
    );

    create table JIUser (
        id number not null,
        username varchar2(100) not null unique,
        tenantId number not null,
        fullname varchar2(100) not null,
        emailAddress varchar2(100),
        password varchar2(100),
        externallyDefined number(1),
        previousPasswordChangeTime date,
        enabled number(1),
        primary key (id),
        unique (username, tenantId)
    );

    create table JIUserRole (
        roleId number not null,
        userId number not null,
        primary key (userId, roleId)
    );

    create table JIXMLAConnection (
        id number not null,
        catalog varchar2(100) not null,
        username varchar2(100) not null,
        password varchar2(100) not null,
        datasource varchar2(100) not null,
        uri varchar2(100) not null,
        primary key (id)
    );
------
    create index access_date_index on JIAccessEvent (event_date);

    create index access_upd_index on JIAccessEvent (updating);

    create index access_user_index on JIAccessEvent (user_id);

    create index access_res_index on JIAccessEvent (resource_id);


    alter table JIAccessEvent 
        add constraint FK47FB3CD732282198 
        foreign key (user_id)
        references JIUser;

    alter table JIAccessEvent 
        add constraint FK47FB3CD7F254B53E 
        foreign key (resource_id) 
        references JIResource;

    alter table JIBeanDatasource 
        add constraint FK674BF34A8BF376D 
        foreign key (id) 
        references JIResource;

    alter table JIContentResource 
        add constraint FKE466FC68A8BF376D 
        foreign key (id) 
        references JIResource;

    alter table JICustomDatasource 
        add constraint FK2BBCEDF5A8BF376D 
        foreign key (id) 
        references JIResource;

    alter table JICustomDatasourceProperty 
        add constraint FKB8A66AEA858A89D1 
        foreign key (ds_id) 
        references JICustomDatasource;

    alter table JIDataType 
        add constraint FK533BCC63A8BF376D 
        foreign key (id) 
        references JIResource;

    alter table JIFileResource 
        add constraint FKF75B58895A0C539 
        foreign key (reference) 
        references JIFileResource;

    alter table JIFileResource 
        add constraint FKF75B5889A8BF376D 
        foreign key (id) 
        references JIResource;

    alter table JIInputControl 
        add constraint FKCAC6A512120E06F7 
        foreign key (data_type) 
        references JIDataType;

    alter table JIInputControl 
        add constraint FKCAC6A512B37DB6EB 
        foreign key (list_query) 
        references JIQuery;

    alter table JIInputControl 
        add constraint FKCAC6A51262A86F04 
        foreign key (list_of_values) 
        references JIListOfValues;

    alter table JIInputControl 
        add constraint FKCAC6A512A8BF376D 
        foreign key (id) 
        references JIResource;

    alter table JIInputControlQueryColumn 
        add constraint FKE436A5CCE7922149 
        foreign key (input_control_id) 
        references JIInputControl;

    alter table JIJNDIJdbcDatasource 
        add constraint FK7F9DA248A8BF376D 
        foreign key (id) 
        references JIResource;

    alter table JIJdbcDatasource 
        add constraint FKC8BDFCBFA8BF376D 
        foreign key (id) 
        references JIResource;

    alter table JIListOfValues 
        add constraint FK4E86A776A8BF376D 
        foreign key (id) 
        references JIResource;

    alter table JIListOfValuesItem 
        add constraint FKD37CEBA993F0E1F6 
        foreign key (id) 
        references JIListOfValues;

    alter table JILogEvent 
        add constraint FK5F32081591865AF 
        foreign key (userId) 
        references JIUser;

    alter table JIMondrianConnection 
        add constraint FK4FF53B191D51BFAD 
        foreign key (id) 
        references JIOlapClientConnection;

    alter table JIMondrianConnection 
        add constraint FK4FF53B19324CFECB 
        foreign key (reportDataSource) 
        references JIResource;

    alter table JIMondrianConnection 
        add constraint FK4FF53B19C495A60B 
        foreign key (mondrianSchema) 
        references JIFileResource;

    alter table JIMondrianXMLADefinition 
        add constraint FK313B2AB8A8BF376D 
        foreign key (id) 
        references JIResource;

    alter table JIMondrianXMLADefinition 
        add constraint FK313B2AB8DC098B1 
        foreign key (mondrianConnection) 
        references JIMondrianConnection;

    alter table JIMondrianXMLADefinition 
        add constraint FK313B2AB8A8BF376D 
        foreign key (id) 
        references JIResource;
------
    create index uri_index on JIObjectPermission (uri);

    alter table JIOlapClientConnection 
        add constraint FK3CA3B7D4A8BF376D 
        foreign key (id) 
        references JIResource;

    alter table JIOlapUnit 
        add constraint FKF034DCCFA8BF376D 
        foreign key (id) 
        references JIResource;

    alter table JIOlapUnit 
        add constraint FKF034DCCF8F542247 
        foreign key (olapClientConnection) 
        references JIOlapClientConnection;

    alter table JIQuery 
        add constraint FKCBCB0EC9A8BF376D 
        foreign key (id) 
        references JIResource;

    alter table JIQuery 
        add constraint FKCBCB0EC92B329A97 
        foreign key (dataSource) 
        references JIResource;

    alter table JIReportJob 
        add constraint FK156F5F6AE4D73E35 
        foreign key (mail_notification) 
        references JIReportJobMail;

    alter table JIReportJob 
        add constraint FK156F5F6A9EEC902C 
        foreign key (content_destination) 
        references JIReportJobRepoDest;

    alter table JIReportJob 
        add constraint FK156F5F6A74D2696E 
        foreign key (job_trigger) 
        references JIReportJobTrigger;

    alter table JIReportJob 
        add constraint FK156F5F6A4141263C 
        foreign key (owner) 
        references JIUser;

    alter table JIReportJobCalendarTrigger 
        add constraint FKC374C7D0D2B2EB53 
        foreign key (id) 
        references JIReportJobTrigger;

    alter table JIReportJobMailRecipient 
        add constraint FKBB6DB6D880001AAE 
        foreign key (destination_id) 
        references JIReportJobMail;

    alter table JIReportJobOutputFormat 
        add constraint FKB42A5CE2C3389A8 
        foreign key (report_job_id) 
        references JIReportJob;

    alter table JIReportJobParameter 
        add constraint FKEAC52B5F2EC643D 
        foreign key (job_id) 
        references JIReportJob;

    alter table JIReportJobSimpleTrigger 
        add constraint FKB9337C5CD2B2EB53 
        foreign key (id) 
        references JIReportJobTrigger;

    alter table JIReportUnit 
        add constraint FK98818B77A8BF376D 
        foreign key (id) 
        references JIResource;

    alter table JIReportUnit 
        add constraint FK98818B778FDA11CC 
        foreign key (query) 
        references JIQuery;

    alter table JIReportUnit 
        add constraint FK98818B77324CFECB 
        foreign key (reportDataSource) 
        references JIResource;

    alter table JIReportUnit 
        add constraint FK98818B778C8DF21B 
        foreign key (mainReport) 
        references JIFileResource;

    alter table JIReportUnitInputControl 
        add constraint FK5FBE934AE7922149 
        foreign key (input_control_id) 
        references JIInputControl;

    alter table JIReportUnitInputControl 
        add constraint FK5FBE934AA6A48880 
        foreign key (report_unit_id) 
        references JIReportUnit;

    alter table JIReportUnitResource 
        add constraint FK8B1C4CA5A6A48880 
        foreign key (report_unit_id) 
        references JIReportUnit;

    alter table JIReportUnitResource 
        add constraint FK8B1C4CA5865B10DA 
        foreign key (resource_id) 
        references JIFileResource;

    alter table JIRepositoryCache 
        add constraint FKE7338B19E7C5A6 
        foreign key (item_reference) 
        references JIRepositoryCache;

    alter table JIResource 
        add constraint FKD444826DA58002DF 
        foreign key (childrenFolder) 
        references JIResourceFolder;

    alter table JIResource 
        add constraint FKD444826DA08E2155 
        foreign key (parent_folder) 
        references JIResourceFolder;

    alter table JIResourceFolder 
        add constraint FK7F24453BA08E2155 
        foreign key (parent_folder) 
        references JIResourceFolder;

    alter table JIRole 
        add constraint FK82724655E415AC2D 
        foreign key (tenantId) 
        references JITenant;

    alter table JITenant 
        add constraint FKB1D7B2C97803CC2D 
        foreign key (parentId) 
        references JITenant;

    alter table JIUser 
        add constraint FK8273B1AAE415AC2D 
        foreign key (tenantId) 
        references JITenant;

    alter table JIUserRole 
        add constraint FKD8B5C1403C31045 
        foreign key (roleId) 
        references JIRole;

    alter table JIUserRole 
        add constraint FKD8B5C14091865AF 
        foreign key (userId) 
        references JIUser;

    alter table JIXMLAConnection 
        add constraint FK94C688A71D51BFAD 
        foreign key (id) 
        references JIOlapClientConnection;

    create sequence hibernate_sequence;


