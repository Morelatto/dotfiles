#!/usr/bin/env zsh
# Virtualization - Virtual machine management

# =============================================================================
# Virtual Machine Management (QEMU/KVM via libvirt)
# =============================================================================
if (( $+commands[virsh] )); then
    alias vmstart='virsh -c qemu:///session start Windows10-VM && sleep 2 && virt-viewer --connect qemu:///session Windows10-VM'
    alias vmstop='virsh -c qemu:///session shutdown Windows10-VM'
    alias vmhibernate='virsh -c qemu:///session managedsave Windows10-VM'
    alias vmstatus='virsh -c qemu:///session list --all'
    alias vmview='virt-viewer --connect qemu:///session Windows10-VM'
    alias vmforce='virsh -c qemu:///session destroy Windows10-VM'
fi
