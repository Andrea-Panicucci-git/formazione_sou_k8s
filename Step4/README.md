## Descrizione Generale

Questo progetto aiuta a distribuire automaticamente un’applicazione containerizzata su Kubernetes usando Jenkins, Docker, Helm e Ansible.
La pipeline di Jenkins si occupa di costruire e distribuire l’immagine Docker, creare e gestire i namespace e i chart Helm su Kubernetes.
La macchina virtuale viene creata con Vagrant e configurata con Ansible, che installa e sistema Docker, Jenkins e tutti gli strumenti Kubernetes (kubectl, kind, helm) necessari, oltre ai permessi per far comunicare tutto bene.

---

## Contenuti del Progetto

- **Jenkins Pipeline**: automatizza il processo di build, deploy e gestione Helm.
- **Vagrantfile**: definisce una VM Ubuntu 22.04 LTS con risorse configurate e provisioning tramite Ansible.
- **playbook.yml**: playbook Ansible che installa Docker, Jenkins, Java 17, Kubernetes tools e configura permessi e gruppi.

---
### Scopo

Configurare Jenkins per:

- Clonare il chart Helm versionato da GitHub (`formazione_sou_k8s`).
- Effettuare il deploy con `helm install` nel namespace Kubernetes `formazione-sou`.
- Consentire a Jenkins di accedere e gestire il namespace `formazione-sou` nel cluster K8s locale.

---
## Come utilizzare questo progetto

### 1. Avvia la macchina virtuale con Vagrant

Apri il terminale nella cartella del progetto e digita:

```bash
vagrant up
```
Questo comando crea e avvia una VM Ubuntu 22.04 LTS, configurata con risorse base. Durante l’avvio, Vagrant esegue automaticamente il provisioning tramite Ansible, che installerà e configurerà:

- Docker
- Jenkins
- Java 17
- Strumenti Kubernetes (kubectl, kind, helm)
- I permessi necessari per far interagire Jenkins con Kubernetes

### 2. Riprovisiona la VM (opzionale)

```bash
vagrant provision
```
### 3. Accedi a Jenkins
Una volta terminato il provisioning, apri il browser e naviga all’indirizzo:
```
http://localhost:8080
```
### 5. Configura le credenziali DockerHub su Jenkins
Nel pannello di Jenkins, configura le credenziali DockerHub con l’ID DockerHub (username e password del tuo account Docker).

### 6. Esegui la pipeline Jenkins
Avvia la pipeline Jenkins, specificando il tag dell’immagine Docker (TAG) che vuoi deployare (di default è latest).

La pipeline eseguirà:

- Il clone della repository Git con il chart Helm
- Il login a DockerHub
- La creazione del namespace Kubernetes formazione-sou (se non già presente)
- Il deploy del chart Helm con il tag specificato nel cluster Kubernetes locale

### 7. Verifica il deploy
Dopo l’esecuzione, controlla i release Helm e assicurati che l’applicazione sia attiva nel namespace formazione-sou.

## Conclusione:

Seguendo questi passaggi, puoi configurare un ambiente completo per sviluppare e distribuire applicazioni containerizzate su Kubernetes, tutto gestito automaticamente da Jenkins e supportato da Ansible e Vagrant.
