import ballerina/http;
import ballerina/log;

// Create an endpoint with port 7090 to accept HTTP requests.
listener http:Listener http2ServiceEP = new (7090);

service /http2Service on http2ServiceEP {

    resource function 'default .(http:Caller caller) {

        // Send a push promise. 
        // For details, see https://lib.ballerina.io/ballerina/http/latest/clients/Caller#promise.
        http:PushPromise promise1 = new (path = "/resource1", method = "GET");
        var promiseResponse1 = caller->promise(promise1);
        if promiseResponse1 is error {
            log:printError("Error occurred while sending the promise1", 'error = promiseResponse1);
        }

        // Send another push promise.
        http:PushPromise promise2 = new (path = "/resource2", method = "GET");
        var promiseResponse2 = caller->promise(promise2);
        if promiseResponse2 is error {
            log:printError("Error occurred while sending the promise2", 'error = promiseResponse2);
        }

        // Send one more push promise.
        http:PushPromise promise3 = new (path = "/resource3", method = "GET");
        var promiseResponse3 = caller->promise(promise3);
        if promiseResponse3 is error {
            log:printError("Error occurred while sending the promise3", 'error = promiseResponse3);
        }

        // Construct the requested resource.
        http:Response res = new;
        json msg = {"response": {"name": "main resource"}};
        res.setPayload(msg);

        // Send the requested resource.
        var response = caller->respond(res);
        if response is error {
            log:printError("Error occurred while sending the response", 'error = response);
        }

        // Construct promised resource1.
        http:Response push1 = new;
        msg = {"push": {"name": "resource1"}};
        push1.setPayload(msg);

        // Push promised `resource1`. 
        // For details, see https://lib.ballerina.io/ballerina/http/latest/clients/Caller#pushPromisedResponse.
        var pushResponse1 = caller->pushPromisedResponse(promise1, push1);
        if pushResponse1 is error {
            log:printError("Error occurred while sending the promised response1", 
                    'error = pushResponse1);
        }

        // Construct promised `resource2`.
        http:Response push2 = new;
        msg = {"push": {"name": "resource2"}};
        push2.setPayload(msg);

        // Push promised `resource2`.
        var pushResponse2 = caller->pushPromisedResponse(promise2, push2);
        if pushResponse2 is error {
            log:printError("Error occurred while sending the promised response2", 
                    'error = pushResponse2);
        }

        // Construct promised `resource3`.
        http:Response push3 = new;
        msg = {"push": {"name": "resource3"}};
        push3.setPayload(msg);

        // Push promised `resource3`.
        var pushResponse3 = caller->pushPromisedResponse(promise3, push3);
        if pushResponse3 is error {
            log:printError("Error occurred while sending the promised response3", 
                    'error = pushResponse3);
        }
    }
}
