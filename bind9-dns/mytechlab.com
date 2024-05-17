$TTL    604800
$ORIGIN mytechlab.com.
@       IN      SOA     ns1.mytechlab.com. root.localhost. (
                     2024011100         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
; nameservers
@       IN      NS      ns.mytechlab.com.

; nameservers Forward lookups
ns      IN      A       10.0.0.10
haproxy IN      CNAME   ns.mytechlab.com.

;RR
master1 IN      A       10.0.0.5
master2 IN      A       10.0.0.6
worker1 IN      A       10.0.0.11
worker2 IN      A       10.0.0.12
