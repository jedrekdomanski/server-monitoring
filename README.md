## Server monitoring
### The app monitors 3 basic server metrics:
- Free disk space - every 1 hour
- Average CPU usage - every 5 minutes
- RAM usage (in megabytes) - every minute

You can enable/disable the checks in `config/config.yml` file

Http server runs on port 9210.

Visit `/status` endpoint to see available metrics in JSON format.

{
  "hostname": "<name>",
  "cpu_avg": "<int>%",
  "disk_usage": "<int>%",
  "mem_usage": "<int>",
  "check_time": "<timestamp YYYY-MM-DD HH:SS>"
}