#!/bin/bash

vms="Spoke1-vm1 Spoke1-vm2 Spoke2-vm1 Spoke2-vm2"

for vm in $vms
do
  echo az vm delete --yes --no-wait --resource-group VDC-${vm%-*} --name ${vm}
  az vm delete --yes --no-wait --resource-group VDC-${vm%-*} --name ${vm}
done



for vm in $vms
do
  echo az vm wait --resource-group VDC-${vm%-*} --name ${vm} --deleted
  az vm wait --resource-group VDC-${vm%-*} --name ${vm} --deleted
done

for vm in $vms
do
  echo az disk delete --yes --no-wait --resource-group VDC-${vm%-*} --name ${vm}-os
  az disk delete --yes --no-wait --resource-group VDC-${vm%-*} --name ${vm}-os
done

for vm in $vms
do
  echo az disk wait --resource-group VDC-${vm%-*} --name ${vm}-os --deleted
  az disk wait --resource-group VDC-${vm%-*} --name ${vm}-os --deleted
done

exit

az vm delete --yes --resource-group VDC-Spoke1 --name Spoke1-vm1
az disk delete --yes --resource-group VDC-Spoke1 --name Spoke1-vm1-os

az vm delete --yes --resource-group VDC-Spoke1 --name Spoke1-vm2
az disk delete --yes --resource-group VDC-Spoke1 --name Spoke1-vm2-os

az vm delete --yes --resource-group VDC-Spoke2 --name Spoke2-vm1
az disk delete --yes --resource-group VDC-Spoke2 --name Spoke2-vm1-os

az vm delete --yes --resource-group VDC-Spoke2 --name Spoke2-vm2
az disk delete --yes --resource-group VDC-Spoke2 --name Spoke2-vm2-os