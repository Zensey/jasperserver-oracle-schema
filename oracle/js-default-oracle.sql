------ Default 
INSERT INTO jitenant (id, tenantid, tenantalias, parentid, tenantname, tenantdesc, tenantnote, tenanturi, tenantfolderuri, theme) VALUES (1, 'organizations', 'organizations', NULL, 'root', 'organizations', ' ', '/', '/', 'default');

INSERT INTO JIRole (id, rolename,tenantId,externallyDefined) VALUES (hibernate_sequence.nextval, 'ROLE_USER', 1, 0);
INSERT INTO JIRole (id, rolename,tenantId,externallyDefined) VALUES (hibernate_sequence.nextval, 'ROLE_ADMINISTRATOR',1,0);
INSERT INTO JIRole (id, rolename,tenantId,externallyDefined) VALUES (hibernate_sequence.nextval, 'ROLE_ANONYMOUS',1,0);

INSERT INTO JIUser (id, username,tenantId,fullname,emailAddress,password,externallyDefined,enabled) VALUES
 (hibernate_sequence.nextval,'anonymousUser',1,'Anonymous User',NULL,'',0,1);
 
INSERT INTO JIUserRole (userId,roleId)
 select u.id, r.id from JIUser u, JIRole r where u.username = 'anonymousUser' and r.roleName = 'ROLE_ANONYMOUS';

INSERT INTO JIUser (id, username,tenantId,fullname,emailAddress,password,externallyDefined,enabled) VALUES
 (hibernate_sequence.nextval, 'jasperadmin',1,'Jasper Administrator',NULL,'password',0,1);

INSERT INTO JIUserRole (userId,roleId)
select u.id, r.id from JIUser u, JIRole r where u.username = 'jasperadmin' and r.roleName = 'ROLE_ADMINISTRATOR';

INSERT INTO JIUserRole (userId,roleId)
select u.id, r.id from JIUser u, JIRole r where u.username = 'jasperadmin' and r.roleName = 'ROLE_USER';


INSERT INTO JIResourceFolder (id,version,uri,hidden,name,label,description,parent_folder,creation_date,update_date) VALUES 
 (hibernate_sequence.nextval,0,'/',0,'/','root','Root of the folder hierarchy',NULL,sysdate,sysdate);

INSERT INTO JIObjectPermission (id, uri,recipientobjectclass,permissionMask,recipientobjectid)
select hibernate_sequence.nextval, 'repo:/','com.jaspersoft.jasperserver.api.metadata.user.domain.impl.hibernate.RepoRole', 1, r.id
from JIRole r where rolename = 'ROLE_ADMINISTRATOR';

INSERT INTO JIObjectPermission (id, uri,recipientobjectclass,permissionMask,recipientobjectid)
select hibernate_sequence.nextval, 'repo:/','com.jaspersoft.jasperserver.api.metadata.user.domain.impl.hibernate.RepoRole', 2, r.id
from JIRole r where rolename = 'ROLE_USER';

-- migrattion

alter table JIInputControl 
    modify query_value_column  varchar2(200);

alter table JIInputControlQueryColumn 
    modify  query_column  varchar2(200);

alter table JIJdbcDatasource 
    modify  connectionUrl  varchar2(2000);    

/*
alter table JILogEvent 
    modify  event_text  varchar2(2000);
alter table JILogEvent  modify      event_data  blob;
*/

/*
ALTER TABLE jireportjobrepodest
    ADD  output_description VARCHAR(100);

ALTER  TABLE jireportjobrepodest
 ADD timestamp_pattern VARCHAR(250);

ALTER TABLE jiuser
    ADD  previouspasswordchangetime DATE;
*/

