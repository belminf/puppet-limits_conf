# Ensures the limit is set

define limits_conf::set($domain, $item, $value, $type='soft') {

    include limits_conf

    augeas { "limits_conf/${domain}/${type}/${item}":
        context => '/files/etc/security/limits.conf',
        changes => [

            # Clean out what is there
            "rm 'domain[.=\"${domain}\"][./type=\"${type}\" and ./item=\"${item}\"]'",

            # Add a new node
            "set domain[last()+1] '${domain}'",

            # Modify new node
            "set domain[last()]/type '${type}'",
            "set domain[last()]/item '${item}'",
            "set domain[last()]/value '${value}'",
        ],
        onlyif => "match 'domain[.=\"$domain\"][./type=\"$type\" and ./item=\"$item\" and ./value=\"$value\"]' != 1",
    }
}
