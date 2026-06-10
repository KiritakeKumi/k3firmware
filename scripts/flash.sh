#!/bin/bash
set -e

DIST_DIR="${1:-.}"

fastboot stage "${DIST_DIR}/FSBL.bin"
fastboot continue
sleep 10
fastboot stage "${DIST_DIR}/u-boot.itb"
fastboot continue
sleep 1
fastboot flash mtd "${DIST_DIR}/partition_4M.json"
fastboot flash bootinfo "${DIST_DIR}/bootinfo_spinor.bin"
fastboot flash fsbl "${DIST_DIR}/FSBL.bin"
fastboot flash env "${DIST_DIR}/u-boot-env-default.bin"
fastboot flash esos "${DIST_DIR}/esos_rt24.itb"
fastboot flash opensbi "${DIST_DIR}/fw_dynamic.itb"
fastboot flash uboot "${DIST_DIR}/u-boot.itb"
