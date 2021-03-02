import ballerina/http;
import ballerina/log;

// Create a client configuration to be passed to the client endpoint.
// Configure the `certFile`, `keyFile` and `trustedCertFile`, which
// are required to enable mutual SSL.
// [secureSocket](https://ballerina.io/learn/api-docs/ballerina/#/ballerina/http/latest/http/records/ClientSecureSocket) record provides the SSL related configurations.
http:ClientConfiguration clientEPConfig = {
    secureSocket: {
        certFile: "/path/to/public.cert",
        keyFile: "/path/to/private.key"
        trustedCertFile: "/path/to/public.cert"
        protocol: {
            name: "TLS"
        },
        ciphers: ["TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA"]
    }
};

public function main() {
    // Create an HTTP client to interact with the created listener endpoint.
    http:Client clientEP = checkpanic new("https://localhost:9095",
                                          clientEPConfig);
    // Send a GET request to the listener and bind the payload to a string value.
    var payload = clientEP->get("/helloWorld/hello", targetType = string);
    if (payload is string) {
        // Log the retrieved text payload.
        log:print(payload);
    } else {
        // If an error occurs when getting the response or binding payload, log the error.
        log:printError((<error>payload).message());
    }
}
