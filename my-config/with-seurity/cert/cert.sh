# # Generate a private key
# openssl genpkey -algorithm RSA -out mongodb-key.key

# # openssl genpkey -algorithm RSA -out ca-key.pem
# # # Generate a self-signed CA certificate
# # openssl req -new -x509 -key ca-key.pem -out ca.pem

# # Generate a certificate signing request
# openssl req -new -key mongodb-key.key -out mongodb-csr.pem

# # Self-sign the certificate (for testing purposes)
# openssl x509 -req -in mongodb-csr.pem -signkey mongodb-key.key -out mongodb-cert.pem

openssl rand -base64 756 > key.key
chmod 400 key.key
sudo chown 999:999 key.key