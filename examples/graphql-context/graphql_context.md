# Context

The `graphql:Context` object can be used to pass meta information between the resolver functions. An init function should be provided using the `graphql:ServiceConfig` parameter named `contextInit`. Inside the init function, the `graphql:Context` can be initialized. Values from the `http:RequestContext` and `http:Request` can be added as well as other values. These values are stored as key-value pairs. The key is a `string` and the value can be any `readonly` value or an `isolated` object. If the init function is not provided, an empty context object will be created. The context can be accessed by defining it as the first parameter of any resolver (resource/remote) function.

For more information on the underlying package, see the [GraphQL package](https://lib.ballerina.io/ballerina/graphql/latest/).

::: code graphql_context.bal :::

Run the service by executing the following command.

::: out graphql_context.server.out :::

Invoke the service as follows.

::: out graphql_context.client.out :::
