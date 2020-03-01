

# CI/CD Demo - Department of Veterns Affairs

This repository includes the infrastructure and pipeline definition for continuous delivery using Jenkins, Nexus, SonarQube and Eclipse Che on OpenShift. 

* [Introduction](#introduction)
* [Prerequisites](#prerequisites)
* [Deploy on RHPDS](#deploy-on-rhpds)
* [Automated Deploy on OpenShift](#automatic-deploy-on-openshift)
* [Demo Guide](#demo-guide)
* [Using Eclipse Che for Editing Code](#using-eclipse-che-for-editing-code)


## Introduction

On every pipeline execution, the code goes through the following steps:

1. Code is cloned from Gogs, built, tested and analyzed for bugs and bad patterns
2. The DLL artifact is pushed to Nexus Repository manager
3. A container image (_va_dotnet_project:latest_) is built based on the _VA_DOTNET_PROJECT_ application DLL artifact deployed on OCP
4. The _VA_DOTNET_PROJECT_ container image is deployed in a fresh new container in DEV project 
5. If tests successful, the pipeline is paused for the release manager to approve the release to STAGE
6. If approved, the DEV image is tagged in the STAGE project. 
6. The staged image is deployed in a fresh new container in the STAGE project 


## Prerequisites
* 10+ GB memory

## Deploy on RHPDS

If you have access to RHPDS, provisioning of this demo is automated via the service catalog under **OpenShift Demos &rarr; OpenShift CI/CD for Monolith**. If you don't know what RHPDS is, read the instructions in the next section.

## Automated Deploy on OpenShift
You can se the `scripts/provision.sh` script provided to deploy the entire demo:

  ```
  ./provision.sh --help
  ./provision.sh deploy --enable-che --ephemeral # with Eclipse Che
  ./provision.sh delete 
  ```
