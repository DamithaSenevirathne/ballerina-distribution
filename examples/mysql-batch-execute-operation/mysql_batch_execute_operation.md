# Batch execute

This BBE demonstrates how to use the MySQL client to execute a batch of DDL/DML operations. 

>**Note:** The MySQL database driver JAR should be defined in the `Ballerina.toml` file as a dependency. The MySQL connector uses database properties from MySQL version 8.0.13 onwards. Therefore, it is recommended to use a MySQL driver version greater than 8.0.13.

For a sample configuration and more information on the underlying module, see the [`mysql` module](https://lib.ballerina.io/ballerinax/mysql/latest/).

::: code mysql_batch_execute_operation.bal :::

::: out mysql_batch_execute_operation.out :::

The following util files will initialize the test database before running the BBE and clean it up afterward.

::: code initialize.bal :::

::: code cleanup.bal :::
