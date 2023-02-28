while read root_domain; do

    # Check if any subdomain resolves
    wildcard=false
    for subdomain in testtest9809 wildcarddomainstesting dontgimmearesultsplz; do
        output=$(dig @1.1.1.1 A,CNAME ${subdomain}.${root_domain} +short)
        if [ ! -z "$output" ]; then
            echo "Wildcard domain: ${root_domain}"
            wildcard=true
            break
        fi
    done

    # If no subdomain resolves, print root domain
    if [ "$wildcard" = false ]; then
        echo "Non-wildcard domain: ${root_domain}"
    fi

done < root_domains.txt
