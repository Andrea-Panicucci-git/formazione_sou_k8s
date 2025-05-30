 # Descrizione

 Questo progetto automatizza la creazione di una macchina virtuale con **Rocky Linux 9** usando **Vagrant**, e la configurazione dell’ambiente tramite **Ansible**, per installare **Docker**, creare una rete personalizzata, e avviare **Jenkins** con un agente collegato.

---

## Requisiti

Assicurati di avere installato:

- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/)
- [Ansible](https://www.ansible.com/)

---

## Struttura del progetto

```plaintext
WorkstationMac-Step1/
├── Vagrantfile
└── playbook.yml
```
---

## Avvio rapido

1. **Clona il repository** o **copia i file nel tuo ambiente**
2. **Avvia la VM con Vagrant:**

   ```bash
   vagrant up
   ```
Questo comando:

- Crea una VM con IP privato 192.168.3.22
- Espone la porta 8080 in localhost
- Lancia il provisioning con Ansible

---

## Vagrantfile

Il file Vagrantfile configura la VM con:

- Box: rockylinux/9
- Rete:
- Porta 8080 mappata su localhost
- IP privato: 192.168.3.22
- VirtualBox:
- RAM: 1024 MB
- Provisioning: tramite playbook.yml con Ansible

---

## Ansible - `playbook.yml`

### Step 1: Installazione Docker

Questa fase prepara l’ambiente Docker sulla macchina Rocky Linux:

-  Installa `python3-requests`
-  Aggiorna la cache dei pacchetti
-  Rimuove `podman-docker` (per evitare conflitti con Docker CE)
-  Aggiunge il repository ufficiale Docker
-  Installa i pacchetti:
  - `docker-ce`
  - `docker-ce-cli`
  - `containerd.io`
  - `docker-compose-plugin`
- Abilita e avvia il servizio `docker`

---

### Step 2: Rete Docker e Container

Configurazione di rete e creazione di container Docker:

#### Rete Docker

- **Nome:** `my_network`
- **Driver:** bridge
- **Subnet:** `192.168.10.0/24`
- **Gateway:** `192.168.10.1`

#### Volume Docker

- **Nome:** `jenkins_data`

#### Container Jenkins

- **Immagine:** `jenkins/jenkins:lts`
- **Porte esposte:**
  - `8080:8080`
  - `50000:50000`
- **Volume montato:**
  - `jenkins_data:/var/jenkins_home`
- **Rete associata:** `my_network`

#### Container Jenkins Agent

- **Immagine:** `jenkins/inbound-agent:latest`
- **Variabili ambiente:**
  - `JENKINS_URL=http://jenkins:8080`
  - `JENKINS_SECRET=2d250dfe6c4b1372fcef99b464ac2ba22748423b140a819a78c5446f6f88e66b`
  - `JENKINS_AGENT_NAME=Jenkins-agent`
- **Rete:** `my_network`
- **IP fisso:** `192.168.10.10`

---

## Accesso a Jenkins

Dopo l'avvio della VM e del container, apri il browser su:

`http://localhost:8080`

---

## Test e Debug

Per accedere alla VM:

```vagrant ssh```

Per visualizzare i container Docker in esecuzione:

```docker ps```

---

## Pulizia

Per distruggere completamente la VM e rimuovere tutte le risorse:

```vagrant destroy -f```

---

## Conclusione

Questa esercitazione permette la creazione di una macchina virtuale basata su Rocky Linux, nell’installazione completa di Docker e nella configurazione di Jenkins con un agent dedicato.  
Tutto il processo è automatizzato grazie all’uso di Vagrant per la gestione della VM e Ansible per la configurazione e il provisioning, permettendoti di creare rapidamente un ambiente di sviluppo e integrazione continua funzionante, senza dover intervenire manualmente.



