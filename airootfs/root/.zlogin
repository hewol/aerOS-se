# fix for screen readers
if grep -Fqa 'accessibility=' /proc/cmdline &> /dev/null; then
    setopt SINGLE_LINE_ZLE
fi

~/.automated_script.sh

echo "nEtWoRk InFo:"
ip a
rm -rf /etc/os-release
rm -rf /etc/lsb-release
mv /etc/os-release2 /etc/os-release
mv /etc/lsb-release2 /etc/lsb-release
