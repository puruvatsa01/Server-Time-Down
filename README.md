📘 Project Summary

This project is designed to help DevOps engineers monitor the health and stability of services more effectively. 
In many organizations, canary tests are run every minute to check whether services are up or down. 
The goal of this SQL-based solution is to automatically detect any service that experiences continuous downtime for at least 5 minutes, 
so that the DevOps team can quickly respond, investigate the root cause, and restore service availability.

The main table used is:
`service_status`: stores service name, status ("up" or "down"), and the timestamp of each check.

The final output lists only those services that had a **continuous outage** of 5 minutes or more, ordered by the total number of minutes they were down (in descending order).

================================

✅ Key Tasks
* Track minute-by-minute status of all services.
* Detect continuous "down" entries for the same service.
* Group these into outage periods of 5 minutes or more.
* Count total downtime per service.
* Return services with highest downtime first.

💼 Business Value
* Helps in **proactive incident response** by identifying prolonged outages quickly.
* Reduces **mean time to resolution (MTTR)** through early alerts.
* Enhances service reliability and customer trust by automating monitoring.
* Assists in building robust **alerting and reporting** mechanisms for engineering teams.
