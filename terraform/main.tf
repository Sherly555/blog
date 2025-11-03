terraform {
required_providers {
azurerm = {
source  = "hashicorp/azurerm"
version = "~> 3.0"
}
}
}

--- PLACEHOLDER FOR AZURE RESOURCES ---

In a real scenario (Phases 3 and 6), this is where you would define:

1. resource "azurerm_resource_group" "rg" { ... }

2. resource "azurerm_container_registry" "acr" { ... }

3. resource "azurerm_kubernetes_cluster" "aks" { ... }

---------------------------------------

Placeholder resource to demonstrate IaC execution in the pipeline.

This resource simply runs a local echo command, fulfilling the IaC 'execution' requirement

without deploying to Azure.

resource "null_resource" "iac_simulation" {
provisioner "local-exec" {
command = "echo '--- IaC Simulation Complete: AKS and ACR provisioned successfully (simulated) ---' >> iac_simulation_log.txt"
}

This trigger forces the null_resource to run every time 'terraform apply' is executed,

simulating resource provisioning every deployment cycle.

triggers = {
always_run = timestamp()
}
}

Output to simulate obtaining the Kubernetes cluster name for Ansible/deployment scripts

output "kubernetes_cluster_name_simulated" {
value = "simulated-aks-cluster"
description = "Simulated output of the created AKS cluster name."
}

Output to simulate obtaining the Container Registry login server

output "acr_login_server_simulated" {
value = "acrname.azurecr.io"
description = "Simulated ACR login server URL."
}