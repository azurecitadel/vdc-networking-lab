#!/bin/bash

az vm delete --yes --resource-group VDC-Spoke1 --name Spoke1-vm1
az disk delete --yes --no-wait --resource-group VDC-Spoke1 --name Spoke1-vm1-os

az vm delete --yes --resource-group VDC-Spoke1 --name Spoke1-vm2
az disk delete --yes --no-wait --resource-group VDC-Spoke1 --name Spoke1-vm2-os

az vm delete --yes --resource-group VDC-Spoke2 --name Spoke2-vm1
az disk delete --yes --no-wait --resource-group VDC-Spoke2 --name Spoke2-vm1-os

az vm delete --yes --resource-group VDC-Spoke2 --name Spoke2-vm2
az disk delete --yes --no-wait --resource-group VDC-Spoke2 --name Spoke2-vm2-os