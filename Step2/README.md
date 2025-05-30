# Descrizione:

# Step 2 - Pipeline Jenkins per Build e Push Immagine Docker Flask

In questo esercizio è realizzata una pipeline Jenkins dichiarativa (Groovy) per costruire e pubblicare un’immagine Docker di una semplice web app Flask "hello world".  
L’immagine Docker sarà poi inviata al tuo account Docker Hub o a un registry locale, gestendo i tag in modo dinamico in base al branch o tag Git.

---

## Obiettivi

- Creare una repository GitHub chiamata `formazione_sou_k8s`
- Scrivere un semplice `Dockerfile` per una app Flask che espone una pagina con la scritta **"hello world"**  
- Creare un account Docker Hub per il push delle immagini
- Scrivere una pipeline Jenkins chiamata `flask-app-example-build` che:
  - Builda l’immagine Docker della web app
  - Effettua il push dell’immagine sul Docker Hub o su un registry locale
  - Gestisce i tag dell’immagine in base al branch/tag Git:
    - Se buildata da un tag Git, usa quel tag come tag dell’immagine
    - Se buildata da `master`, usa il tag `latest`
    - Se buildata da `develop`, usa il tag `develop-<SHA commit>`

---

## Passaggi principali

`1. Preparazione dell'ambiente`

   - Crea un repository GitHub denominato formazione_sou_k8s.
   - Crea un account su Docker Hub.
   - Crea un file Dockerfile per un'app Flask che esponga una pagina "Hello World".
   - Crea un file Jenkinsfile per la pipeline.
     
`2. Configurazione della pipeline Jenkins`

   - Definisci la pipeline come dichiarativa.
   - Aggiungi le credenziali Docker Hub a Jenkins.
   - Implementa le seguenti fasi:
   - Checkout: Recupera il codice dal repository.
   - Build: Costruisci l'immagine Docker.
   - Tagging: Assegna un tag all'immagine basato sul branch Git:
   - latest per il branch master.
   - develop-SHA per il branch develop, dove SHA è l'hash del commit.
   - Il tag Git per altri branch.
   - Push: Esegui il push dell'immagine su Docker Hub con i tag appropriati.
     
`3. Gestione dei tag Git`

   - Assicurati che i tag Git siano disponibili nella pipeline:
   - Esegui git fetch --tags per recuperare i tag.
   - Utilizza git tag -l per elencare i tag disponibili.
   - Includi i tag nel checkout del codice per renderli disponibili nelle fasi successive.
     
`4. Configurazione del Docker Registry (opzionale)`

   - Se si verificano problemi con i limiti di Docker Hub, considera l'installazione di un registry Docker locale.
   - Modifica la pipeline per utilizzare il registry locale, se necessario.
     
`5. Esecuzione della pipeline`

   - Esegui la pipeline in Jenkins per testare la build e il push dell'immagine Docker.
   - Verifica che l'immagine sia disponibile su Docker Hub con i tag corretti.

## Conclusione 

Questa struttura ti permette di automatizzare il processo di build e distribuzione dell'applicazione Flask, garantendo coerenza nei tag delle immagini Docker in base ai branch Git.

