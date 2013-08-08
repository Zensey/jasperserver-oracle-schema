This is a port of original JasperServer v 4.5.0 PostgreSQL schema to oracle.

First of all, you must add oracle hibernate dialect to handle blobs properly 

copy hibernate/ji to
jasperserver-repository-hibernate/src/main/java/com/jaspersoft


Second, go to oracle/ and run scripts in order to create schema and fill it with initial data