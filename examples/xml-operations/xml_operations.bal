import ballerina/io;

public function main() returns error? {
    xml x1 = xml `<name>Sherlock Holmes</name>`;
    xml:Element x2 = 
        xml `<details>
                <author>Sir Arthur Conan Doyle</author>
                <language>English</language>
            </details>`;

    // `+` does concatenation.
    xml x3 = x1 + x2;

    io:println(x3);

    xml x4 = xml `<name>Sherlock Holmes</name><details>
                        <author>Sir Arthur Conan Doyle</author>
                        <language>English</language>
                  </details>`;
    // `==` does a deep equality check.
    boolean eq = x3 == x4;

    io:println(eq);

    // `foreach` iterates over each item.
    foreach var item in x4 {
        io:println(item);
    }

    // `x[i]` gives the `i-th` item (empty sequence if none).
    io:println(x3[0]);

    // `x.id` accesses a required attribute named `id`: the result is `error` if there is no such 
    // attribute or if `x` is not a singleton.
    xml x5 = xml `<para id="greeting">Hello</para>`;
    string id = check x5.id;

    // Since an attribute named `id` exists in the `xml` value on which required attribute access 
    // is done, the result of the access will be the value of the attribute (`"greeting"`).
    io:println(id);

    // `x?.id` accesses an optional attribute named `id`: the result is `()` if there is no such 
    // attribute.
    string? name = check x5?.name;

    // Since an attribute named `name` does not exist in the `xml` value on which optional 
    // attribute access is done, the result of the access is nil. Therefore, the following
    // `is` check evaluates to `true`.
    io:println(name is ());

    // Mutate an element using `e.setChildren(x)`.
    x2.setChildren(xml `<language>French</language>`);

    // The `xml` value assigned to `x2` will now include `<language>French</language>` as a 
    // child element.
    io:println(x2);

    // Since the value assigned to `x3` used `x2` in the concatenation, the change will also 
    // be reflected in `x3`.
    io:println(x3);
}
