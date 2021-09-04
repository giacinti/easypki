# easypki
A PKI environment based on easyrsa + lots of bash scripts

- create_root_ca: create a self signed root CA
- create_sub_ca: create sub CA (intermediate CA) signed by a root CA
- destroy_ca: destroy a CA (sub or root - double warning if root CA)
- update_crl: regenerate crl (until Jan 2038) for the CA
- rotate_crl: export current crl (for this month) in pem format into pub dir
- update_cron: (re)generate cron job's for rotating crl's each month
- update_ocsp_resp: start ocsp responder for CA's (and kill previous ones) + update proxy
- start: startup script to be called by docker entry point

- easypki: main command
  - easypki [any of the commands above]
  - easypki --ca=CA_NAME [any of easyrsa commands & options]


* examples:
$ easypki create_root_ca => just need a CA name, CA CN and password [automatically update crl & ocsp responder]
$ easypki create_sub_ca => Root CA, Root passwd, CA name, CA CN & CA password [automatically update crl & ocsp responder]
$ easypki destroy_ca => just the name & password
$ easypki --ca=SUBCA --subject-alt-name=email:myserver@example.com build-server-full myserver.example.com nopass
$ easypki --ca=SUBCA revoke myserver.example.com
$ easypki update_crl SUBCA

