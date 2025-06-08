#!/bin/bash

set -euo pipefail

KERNEL_VERSION=amogus

# echo "▶ Starting compilation and installation kernel 🛠️"

# Ensure required tools are installed
# REQUIRED_TOOLS=("base-devel" "clang" "llvm" "make" "bc" "ncurses" "flex" "bison" "libelf" "git" "sudo")
# for TOOL in "${REQUIRED_TOOLS[@]}"; do
#   if ! pacman -Qq "$TOOL" &>/dev/null; then
#     echo "❌ Missing required tool: $TOOL. Please install it using 'pacman -S' and rerun the script."
#     exit 1
#   fi
# done

# Clear previous build
echo "🧹 Cleaning previous build..."
make clean

sleep 1

# Check for .config
if [[ ! -f .config ]]; then
  echo "❌ No .config found. Please create or copy a kernel configuration file."
  exit 1
fi

# Enable Clang LTO
./scripts/config --enable LTO_CLANG

# Start compiling kernel
echo "🚀 Compiling kernel with Clang..."
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor &>/dev/null

make LLVM=1 \
  CC="ccache clang" \
  CXX="ccache clang++" \
  HOSTCC=clang \
  LD=ld.lld \
  AR=llvm-ar \
  NM=llvm-nm \
  OBJCOPY=llvm-objcopy \
  OBJDUMP=llvm-objdump \
  KBUILD_BUILD_TIMESTAMP=''\
  -j$(nproc) | tee build.log

# Install modules
echo "📦 Installing modules..."
sudo make modules_install \
  LLVM=1 \
  CC=clang \
  CXX=clang++ \
  HOSTCC=clang \
  LD=ld.lld \
  AR=llvm-ar \
  NM=llvm-nm \
  OBJCOPY=llvm-objcopy \
  OBJDUMP=llvm-objdump \
  STRIP=llvm-strip \
  -j$(nproc) | tee -a build.log

# Export kernel artifacts
echo "📤 Exporting kernel artifacts..."
sudo cp ./arch/x86/boot/bzImage "/boot/vmlinuz-${KERNEL_VERSION}"
sudo cp System.map "/boot/System.map-${KERNEL_VERSION}"
sudo cp .config "/boot/config-${KERNEL_VERSION}"

# Generate initramfs and update GRUB
echo "📝 Generating initramfs and updating GRUB..."
sudo mkinitcpio -k $(make -s kernelrelease) -g /boot/initramfs-${KERNEL_VERSION}.img | tee -a build.log
sudo grub-mkconfig -o /boot/grub/grub.cfg | tee -a build.log

# Reset CPU scaling governor
echo schedutil | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor &>/dev/null

echo "✅ Amogus kernel has been installed. Reboot to apply the changes. 😋"
