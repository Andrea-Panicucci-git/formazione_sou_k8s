# Deployment Checker

Questo script Bash permette di:

1. Trovare un Deployment Kubernetes in base a un'etichetta (`label`).
2. Esportarlo in formato YAML.
3. Verificare la presenza di attributi obbligatori nel Deployment, come probe e risorse.

---

## Funzionalità

- Ricerca automatica del Deployment tramite `kubectl` e una label specifica.
- Esportazione del Deployment in un file YAML.
- Controlli su attributi critici:
  - `readinessProbe`
  - `livenessProbe`
  - `resources.limits`
  - `resources.requests`

---

## Requisiti

- **kubectl** installato e configurato per accedere al cluster Kubernetes.
- **jq** per il parsing JSON.
- Permessi sufficienti per eseguire `kubectl get` sul namespace specificato.

---

## Utilizzo

### 1. Configura le variabili

Modifica o esporta queste variabili nel tuo ambiente prima di eseguire lo script:

```bash
NAMESPACE="nome-del-namespace"
APP_LABEL="etichetta-app-es: app=myapp"
OUTPUT_FILE="output.yaml"
```
### 2. Esegui lo script
```
bash Check-Deployment.sh
```
Lo script eseguirà i seguenti passaggi:

- Troverà il nome del Deployment con la label specificata.
- Esporterà il Deployment in un file YAML.
- Verificherà che i campi obbligatori siano presenti nel JSON del Deployment

### 3. Controlli effettuati

Lo script verifica che i seguenti attributi siano presenti e non nulli:
```
.spec.template.spec.containers[0].readinessProbe
.spec.template.spec.containers[0].livenessProbe
.spec.template.spec.containers[0].resources.limits
.spec.template.spec.containers[0].resources.requests
```
Se uno di questi attributi manca, lo script termina con un messaggio di errore.

## Output

- Deployment esportato: salvato nel file specificato da $OUTPUT_FILE.
- Messaggi di log: mostrano lo stato delle operazioni e gli errori, se presenti.
