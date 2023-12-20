#!/bin/bash

# Get IP Address
IP_ADDRESS=$(ip -o -4 addr show | grep -E 'inet\s' | awk '{print $4}' | cut -d'/' -f1)

# Get Gateway/Mask
GATEWAY_MASK=$(ip route | grep default | awk '{print $3}')

# Get Operating System
OS=$(cat /etc/os-release | grep PRETTY_NAME | cut -d'"' -f2)

# Get vCPU Count
VCPU_COUNT=$(nproc)

# Get Memory (GB)
MEMORY_GB=$(free -g | awk '/^Mem:/{print $2}')

# Get System Disk (GB)
SYSTEM_DISK_GB=$(df -h / | awk 'NR==2 {print $2}')

# Display Information
echo "IP地址: $IP_ADDRESS"
echo "网关/掩码: $GATEWAY_MASK"
echo "操作系统: $OS"
echo "vCPU数量: $VCPU_COUNT"
echo "内存(GB): $MEMORY_GB"
echo "系统盘(GB): $SYSTEM_DISK_GB"

