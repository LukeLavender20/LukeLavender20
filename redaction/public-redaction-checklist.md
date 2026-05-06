# Public Redaction Checklist

Use this before publishing anything about private small-business operations, Microsoft 365, network operations, endpoint management, or DocumentAI.

## Remove Or Replace

- Tenant IDs, subscription IDs, directory IDs, application IDs, object IDs, client IDs, and certificate thumbprints.
- IP addresses, MAC addresses, VLAN IDs, serial numbers, switch/router/AP names, printer names, and DHCP scopes.
- Internal DNS names, public DNS names used for admin access, reverse proxy routes, SMB paths, VPN details, and firewall/NSG rules.
- Employee names, customer names, job names, addresses, phone numbers, emails, signatures, and photos.
- Device names, usernames, local profile paths, installer names, and assigned-owner details.
- Mongo database names, collection exports, connection strings, blob/container names, and real log excerpts.
- Screenshots with browser address bars, usernames, device names, customer/job rows, ticket IDs, or file paths.
- Exact deployment app IDs, assignment groups, package URLs, Intune tenant names, and live policy names.
- Security hardening details that would help an attacker map the real environment.
- Operational findings such as stale devices, broken enrollment, wrong-network status, mailbox forwarding, exposed services, or security gaps.
- Exact cutover, rollback, reset, password recovery, VPN, firewall, DNS, SMB, or admin-access procedures.

## Safe Replacements

- Use `example.com`, `contoso.local`, `files.example.local`, and `10.0.0.0/24` style placeholders.
- Use fake employees like `Installer A`, `Office User B`, and `Admin User`.
- Use fake customers like `Sample Customer` and fake jobs like `Kitchen Remodel 1001`.
- Use generic device names like `OFFICE-LAPTOP-01`, `SHOP-PC-01`, and `FIELD-TABLET-01`.
- Use fake app IDs like `00000000-0000-0000-0000-000000000000`.
- Summarize counts and outcomes instead of showing raw inventories.

## Safer Ways To Show The Work

- Rebuild screenshots with seeded fake data.
- Redraw architecture diagrams from scratch with generic labels.
- Publish script patterns with fake defaults and no production constants.
- Describe decisions, tradeoffs, validation, rollback, and results.
- Keep exact live topology, access paths, and credentials private.
- Phrase roadmap items carefully. If a feature is partial, staged, or planned, call it planned instead of implying it is fully live.

## Final Check

Before publishing, ask:

1. Could this help someone find or access the real environment?
2. Could this identify an employee, customer, job, device, or private vendor?
3. Could this expose how authentication, network reachability, or remote management works?
4. Could this embarrass a client or employee if indexed by search engines?
5. Is the example useful even after replacing every private value with fake data?

If the answer to any of the first four is yes, do not publish it.
