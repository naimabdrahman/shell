# dnsmasq Sample Configurations

This folder contains several sample configuration files for `dnsmasq`, a lightweight DNS, DHCP, and TFTP server. These examples demonstrate typical use cases such as local domain setup, DNS forwarding, DHCP configuration, and split DNS. The configs are numbered for convenience, with newer examples (config 5 and 6) providing more robust setups.

## File List

- `dnsmasq.conf.txt` - Minimal config sample for basic DNS forwarding.
- `dnsmasq.conf2.txt` - Example config with multiple listen-addresses and domain setup.
- `dnsmasq.conf3.txt` - Config for an "openshift.nar" domain with subdomain address mapping.
- `dnsmasq.conf4.txt` - Similar to config3, with settings for "nar.local" domain.
- `dnsmasq.conf5` - Improved config demonstrating local domain settings and DNS forwarding by domain.
- `dnsmasq.conf6` - Advanced config with split DNS, PTR records for reverse lookups, and clear separation of local and forwarded domains.
- `tips-n-tricks.txt` - Additional practical notes and references on multi-server DNS forwarding and example `/etc/hosts` files.

## Highlights: Config 5 and Config 6

### `dnsmasq.conf5`
- Shows how to forward DNS requests for a specific domain (e.g., `nar2.local`) to a separate DNS server.
- Includes clear local domain setup (`nar.local`) and subdomain mapping.
- Layout is commented and easy to adapt to different local network scenarios.
- Example:
  ```
  server=/nar2.local/192.168.157.247
  server=8.8.8.8
  server=8.8.4.4
  ```

### `dnsmasq.conf6`
- Builds upon config 5 with split DNS and reverse DNS support (PTR records).
- Distinguishes between local-only queries and those forwarded to upstream/public servers.
- Example PTR record for reverse lookups:
  ```
  ptr-record=111.157.168.192.in-addr.arpa,test2c.nar.local
  ```
- Well-organized for environments needing both internal resolution and forwarding for specific TLDs.

## Notes on Older Configs

- Older configs (`dnsmasq.conf.txt`, `dnsmasq.conf2.txt`, `dnsmasq.conf3.txt`, `dnsmasq.conf4.txt`) provide basic setups, mostly for single-domain or minimal forwarding scenarios.
- They may lack advanced features like domain-based forwarding and PTR records.
- Use them as starting points for simple deployments, but consider configs 5 and 6 for more complex or scalable environments.

## Tips and References

See `tips-n-tricks.txt` for:
- Real-world multi-server forwarding examples
- Reference links for advanced setups
- Example `/etc/hosts` files for use with these configs

## Usage

To use a config:
1. Copy the desired configuration file to `/etc/dnsmasq.conf`.
2. Adjust domain names, IP addresses, and options to fit your local network.
3. Restart `dnsmasq` for changes to take effect.

For more details on configuration options, consult the official [dnsmasq documentation](http://www.thekelleys.org.uk/dnsmasq/doc.html).
