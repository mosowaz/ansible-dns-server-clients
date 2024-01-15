$TTL    604800
$ORIGIN mytechlab.com.                                  
@       IN      SOA     ns1.mytechlab.com. root.localhost. (
                     2024011100         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
; nameservers
@       IN      NS      ns1.mytechlab.com.              
@       IN      NS      ns2.mytechlab.com.
        IN      MX  10  mail.mytechlab.com.

; nameservers Forward lookups
ns1     IN      A       10.0.0.5
ns2     IN      A       10.0.0.6
mobile  IN      CNAME   ns1.mytechlab.com.              

; RR
ubuntu1         IN      A       10.0.0.5
ubuntu2         IN      A       10.0.0.6
almalinux       IN      A       10.0.0.8
opensuse1       IN      A       10.0.0.7                
opensuse2       IN      A       10.0.0.9
