# Trova il nome del deployment basato sull'etichetta
DEPLOYMENT_NAME=$(kubectl get deploy -n "$NAMESPACE" -l "$APP_LABEL" -o jsonpath="{.items[0].metadata.name}")
[ -z "$DEPLOYMENT_NAME" ] && error_exit "Nessun deployment trovato con label $APP_LABEL nel namespace $NAMESPACE"

echo "Trovato deployment: $DEPLOYMENT_NAME"

# Esporta il Deployment in formato YAML
kubectl get deployment "$DEPLOYMENT_NAME" -n "$NAMESPACE" -o yaml > "$OUTPUT_FILE" || error_exit "Errore durante l'esportazione del deployment"

echo "Export effettuato in $OUTPUT_FILE"

# Verifica attributi richiesti
echo "Controllo attributi obbligatori..."

# Parsing JSON per controllo
DEPLOYMENT_JSON=$(kubectl get deployment "$DEPLOYMENT_NAME" -n "$NAMESPACE" -o json)

# Controlla che un attributo sia presente nel JSON DEPLOYMENT_JSON.
# $1 = path jq da verificare, $2 = nome leggibile dell'attributo.
# Termina lo script con errore se l'attributo manca o è nullo.

check_path() {
    echo "$DEPLOYMENT_JSON" | jq -e "$1" > /dev/null || error_exit "Assente attributo richiesto: $2"
}

check_path '.spec.template.spec.containers[0].readinessProbe' "ReadinessProbe"
check_path '.spec.template.spec.containers[0].livenessProbe' "LivenessProbe"
check_path '.spec.template.spec.containers[0].resources.limits' "resources.limits"
check_path '.spec.template.spec.containers[0].resources.requests' "resources.requests"

echo "Tutti gli attributi richiesti sono presenti."