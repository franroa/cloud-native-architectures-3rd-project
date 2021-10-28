export CT_DB_USERNAME=ct_admin
export CT_DB_NAME=postgres

cat ../db/refactored/location_2020-08-15_init-db.sql | kubectl exec -i $1 -- bash -c "psql -U $CT_DB_USERNAME -d $CT_DB_NAME"
cat ../db/refactored/udaconnect_public_location.sql | kubectl exec -i $1 -- bash -c "psql -U $CT_DB_USERNAME -d $CT_DB_NAME"
