# system76 packages:

sys76-kb
system76-acpi-dkms
system76-dkms
system76-driver
system76-io-dkms
system76-keyboard-configurator
system76-oled
system76-power

systemctl enable --now system76.service
systemctl enable --now system76-power.service
systemctl enable --now system76-firmware-daemon.service
systemctl enable --now com.system76.PowerDaemon.service
