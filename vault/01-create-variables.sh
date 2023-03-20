vault secrets enable -path=secret -version=2 kv
vault kv put secret/variables/var1 value="Value 1"



vault kv put secret/connections/conn1 \
 conn_uri="postgresql://user:password@1.1.1.1:5432/postgresdb?sslmode=verify-ca&sslcert=%2Ftmp%2Fclient-cert.pem&sslkey=%2Ftmp%2Fclient-key.pem&sslrootcert=%2Ftmp%2Fserver-ca.pem" 
