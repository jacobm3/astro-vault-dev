vault auth enable approle
vault policy write astro_policy - <<EOF
path "secret/*" {
  capabilities = ["create", "read", "update", "patch", "delete", "list"]
}
EOF

vault auth enable approle
vault write auth/approle/role/astro_role \
    role_id=astro_role \
    secret_id_ttl=0 \
    secret_id_num_uses=0 \
    token_num_uses=0 \
    token_ttl=24h \
    token_max_ttl=24h \
    token_policies=astro_policy

vault list auth/approle/role

vault write -f auth/approle/role/astro_role/secret-id

# $ vault write -f auth/approle/role/astro_role/secret-id
# Key                   Value
# ---                   -----
# secret_id             5e0b2965-625c-0481-70bd-3be8eb141e76
# secret_id_accessor    92e8a333-1487-fe5c-a2fb-7090c80d40ed
# secret_id_num_uses    0
# secret_id_ttl         0s
