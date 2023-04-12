import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "Shipping",
    id: "Shipping-7eadbda1-9a07-404d-969a-f5a6656d867e"
}
service / on new http:Listener(9090) {

    @display {
        label: "Tracking",
        id: "Tracking-20659191-d937-4469-9c37-5a91a156d77c"
    }
    http:Client trackingClient;

    function init() returns error? {
        self.trackingClient = check new ("");
    }

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
