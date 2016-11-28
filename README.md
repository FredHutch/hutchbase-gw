# hutchbase-gw

Configure and deploy software for the lightweight HutchBase gateway application

# Vault Configuration:

The vault `hutchbase-gw/tls` contains the TLS data- the SSL certificate and key required for nginx.  Note that certificates need to be on a single line for the JSON format- replace the newline with `\n`.  the full example can be found in `test/default/data_bags/hutchbase-gw/tls.json`:

```
{
    "id": "tls",
    "cert": "-----BEGIN CERTIFICATE-----\nMIID...bitIRw==\n-----END CERTIFICATE-----\n",
    "key": "-----BEGIN PRIVATE KEY-----\nMIIEv...cifls=\n-----END PRIVATE KEY-----\n"
}
```

`hutchbase-gw/sudo` contains the list of users who have full sudo access to the host:

```
{
   "id": "sudo",
   "users": ["alice","bob"]
}
```

