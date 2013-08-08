package com.jaspersoft.ji.hibernate.dialect;

import org.hibernate.dialect.Oracle8iDialect;

public class OracleUnicodeDialect extends Oracle8iDialect
{

    public OracleUnicodeDialect()
    {
        registerColumnType(1, "nchar(1)");
        registerColumnType(12, 2000, "nvarchar2($l)");
        registerColumnType(2005, "nclob");
    }
}
