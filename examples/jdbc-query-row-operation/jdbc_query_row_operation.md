# Query with one result

This BBE demonstrates how to use the JDBC client select query row operations.

>**Note:** The relevant database driver JAR should be defined in the `Ballerina.toml` file as a dependency. This sample is based on an H2 database and the H2 database driver JAR needs to be added to the `Ballerina.toml` file. This sample is written using H2 2.0.6 and it is recommended to use an H2 JAR file of a version higher than 2.0.2.

For a sample configuration and more information on the underlying module, see the [`jdbc` module](https://lib.ballerina.io/ballerinax/java.jdbc/latest/).

::: code jdbc_query_row_operation.bal :::

::: out jdbc_query_row_operation.out :::

The following util files will initialize the test database before running the BBE and clean it up afterward.

::: code initialize.bal :::

::: code cleanup.bal :::
