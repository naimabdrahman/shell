# dnsmasq Configuration Samples and Tips

This directory contains a collection of sample configuration files and helpful tips for using [dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html), a lightweight DNS, DHCP, and TFTP server.

## Contents

- `dnsmasq.conf.txt`  
  A basic example of a dnsmasq configuration file.

- `dnsmasq.conf2.txt`  
  An alternative configuration sample with different settings.

- `dnsmasq.conf3.txt`  
  Another configuration example, illustrating further options or scenarios.

- `dnsmasq.conf4.txt`  
  A fourth configuration file with additional variations.

- `dnsmasq.conf5`  
  A more advanced or specialized configuration example.

- `dnsmasq.conf6`  
  Another configuration variant for specific use cases.

- `tips-n-tricks.txt`  
  Helpful notes, tips, and tricks related to running or tuning dnsmasq.

## Usage

Feel free to use these configuration files as templates or starting points for your own `dnsmasq` setup. Copy the desired file (e.g., `dnsmasq.conf.txt`) to your system and adjust paths, interfaces, or other parameters to fit your environment.

To use a configuration sample:

1. Copy the contents of the chosen `dnsmasq.conf*` file to your system's `dnsmasq.conf` (commonly found in `/etc/dnsmasq.conf`).
2. Edit the file as needed for your local network or requirements.
3. Restart the `dnsmasq` service for changes to take effect.

Example (on Linux):

```sh
sudo cp dnsmasq.conf2.txt /etc/dnsmasq.conf
sudo systemctl restart dnsmasq
```

For troubleshooting, optimization, or additional features, refer to `tips-n-tricks.txt`.

## Requirements

- [dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html) installed on your system.

## References

- Official documentation: http://www.thekelleys.org.uk/dnsmasq/doc.html

## Disclaimer

These files are provided as examples only. Review and update them according to your network's security and operational requirements.

---

Feel free to contribute improvements or additional examples!
