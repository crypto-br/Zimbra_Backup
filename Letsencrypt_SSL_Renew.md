# Zimbra Letsencrypt SSL Renew
``` Forkerd ugurerkan/zimbra-letsencrypt-renew.md ```
**Zimbra Version:** ``` Release 8.6.0_GA_1153.RHEL7_64_20141215151110 RHEL7_64 FOSS edition ```

**Based on Zimbra Article  KB 22434** : https://wiki.zimbra.com/wiki/Installing_a_LetsEncrypt_SSL_Certificate

## Let's Begin
Log on Zimbra user then stop proxy and mail box service for renew proccess.
```sh
su zimbra
zmproxyctl stop
zmmailboxdctl stop
```
Then return root user and renew Letsencrypt certificate
```sh
exit
letsencrypt renew
```
Change directory to Zimbra Letsecnrpyt SSL folder
```sh
cd /opt/zimbra/ssl/letsencrypt/
```
Copy new SSL files to Zimbra Letsencrypt folder then change owner to Zimbra.

At this point change ***{YourSSLDomain}*** to your domain which is we are working on.
```sh
cp /etc/letsencrypt/live/{YourSSLDomain}/* .
chown zimbra:zimbra /opt/zimbra/ssl/letsencrypt/*
```
Add X3 root certificate to our chain.pem 
```sh
nano /opt/zimbra/ssl/letsencrypt/chain.pem
```
```
-----BEGIN CERTIFICATE-----
MIIDSjCCAjKgAwIBAgIQRK+wgNajJ7qJMDmGLvhAazANBgkqhkiG9w0BAQUFADA/
MSQwIgYDVQQKExtEaWdpdGFsIFNpZ25hdHVyZSBUcnVzdCBDby4xFzAVBgNVBAMT
DkRTVCBSb290IENBIFgzMB4XDTAwMDkzMDIxMTIxOVoXDTIxMDkzMDE0MDExNVow
PzEkMCIGA1UEChMbRGlnaXRhbCBTaWduYXR1cmUgVHJ1c3QgQ28uMRcwFQYDVQQD
Ew5EU1QgUm9vdCBDQSBYMzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
AN+v6ZdQCINXtMxiZfaQguzH0yxrMMpb7NnDfcdAwRgUi+DoM3ZJKuM/IUmTrE4O
rz5Iy2Xu/NMhD2XSKtkyj4zl93ewEnu1lcCJo6m67XMuegwGMoOifooUMM0RoOEq
OLl5CjH9UL2AZd+3UWODyOKIYepLYYHsUmu5ouJLGiifSKOeDNoJjj4XLh7dIN9b
xiqKqy69cK3FCxolkHRyxXtqqzTWMIn/5WgTe1QLyNau7Fqckh49ZLOMxt+/yUFw
7BZy1SbsOFU5Q9D8/RhcQPGX69Wam40dutolucbY38EVAjqr2m7xPi71XAicPNaD
aeQQmxkqtilX4+U9m5/wAl0CAwEAAaNCMEAwDwYDVR0TAQH/BAUwAwEB/zAOBgNV
HQ8BAf8EBAMCAQYwHQYDVR0OBBYEFMSnsaR7LHH62+FLkHX/xBVghYkQMA0GCSqG
SIb3DQEBBQUAA4IBAQCjGiybFwBcqR7uKGY3Or+Dxz9LwwmglSBd49lZRNI+DT69
ikugdB/OEIKcdBodfpga3csTS7MgROSR6cz8faXbauX+5v3gTt23ADq1cEmv8uXr
AvHRAosZy5Q6XkjEGB5YGV8eAlrwDPGxrancWYaLbumR9YbK+rlmM6pZW87ipxZz
R8srzJmwN0jP41ZL9c8PDHIyh8bwRLtTcm1D9SZImlJnt1ir/md2cXjbDaJWFBM5
JDGFoqgCWjBH4d1QB7wCCZAA62RjYJsWvIjJEubSfZGL+T0yjWW06XyxV3bqxbYo
Ob8VZRzI9neWagqNdwvYkQsEjgfbKbYK7p2CNTUQ
-----END CERTIFICATE-----
```
Now let's check our certificates are verified via Zimbra certificate manager
```sh
/opt/zimbra/bin/zmcertmgr verifycrt comm privkey.pem cert.pem chain.pem 
```
If you see ***done*** message in your console, first make a backup of course...
```sh
cp -a /opt/zimbra/ssl/zimbra /opt/zimbra/ssl/zimbra.$(date "+%Y%m%d")
```
Soooo, we are ready to deploy new certificates, run deploycrt command via zmcertmgr.
```sh
/opt/zimbra/bin/zmcertmgr deploycrt comm cert.pem chain.pem 
```
at last, here is a happy restart.
```sh
su zimbra
zmcontrol restart
```
