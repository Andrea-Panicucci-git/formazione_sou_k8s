### Descrizione 

## Helm Chart Personalizzato per il Deploy dell’Applicazione Flask

In questo progetto trovi un **Helm Chart creato su misura** per distribuire l’immagine Docker prodotta dalla pipeline `flask-app-example-build`.  
Il chart è progettato per permettere la selezione del tag dell’immagine da rilasciare, offrendo così un deploy semplice e configurabile in base alle esigenze.

---

## Struttura del progetto:

formazione_sou_k8s/
└── charts/
└── flask-app-chart/
├── Chart.yaml
├── values.yaml
├── templates/
│ ├── deployment.yaml
│ ├── service.yaml
│ └── ...
└── ...

---

## Prerequisiti

- Helm (versione 3 o superiore) installato sul sistema
- Accesso a un cluster Kubernetes (locale o remoto)
- Immagine Docker buildata e disponibile in un registry accessibile
- Git per clonare il repository

---

## Creazione del Chart

1. Posizionarsi nella directory `charts` della repo:

   ```bash
   cd formazione_sou_k8s/charts
   ```

2. Creare il chart base con Helm:
   ```bash
    helm create flask-app-chart
   ```
3. Modificare values.yaml per configurare i parametri immagine:
    ```yaml
    image:
    repository: andreapanicucci/docker-image
    pullPolicy: IfNotPresent
    tag: "latest"
   ```
4. Aggiornare Chart.yaml con le informazioni del chart e la versione.

## Spiegazione 

In questa esercitazione abbiamo creato un Helm Chart personalizzato per il deploy dell’immagine Docker generata dalla pipeline `flask-app-example-build`.  
Il chart permette di specificare il tag dell’immagine da rilasciare come parametro, rendendo il deploy flessibile e facilmente aggiornabile.  
Come riferimento sono stati utilizzati esempi da [flask-chart di The Data Incubator](https://github.com/thedataincubator/flask-chart) e dai chart ufficiali Bitnami.  
Il chart è stato versionato e organizzato all’interno della repository `formazione_sou_k8s`, nella sottocartella `charts`, per mantenere ordine e tracciabilità delle modifiche.

---

## Conclusione

Questo Helm Chart personalizzato offre una soluzione efficace per gestire in modo chiaro e flessibile il deploy dell' applicazione Flask containerizzata.  
Mantenere il chart versionato all’interno della repository dedicata semplifica la manutenzione, la collaborazione e l’integrazione con pipeline CI/CD come Jenkins.  
Adottando questa organizzazione e metodo, potrai gestire con facilità e affidabilità i deploy su Kubernetes, garantendo qualità e controllo nel processo di rilascio.









   
