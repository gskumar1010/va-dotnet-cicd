oc create secret generic mssql --from-literal=SA_PASSWORD="Admin12345678"
oc apply -f ../database/storage.yaml
oc apply -f ../database/sqldeployment.yaml
