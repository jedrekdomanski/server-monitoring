## Server monitoring
### The app monitors 3 basic server metrics:
- Free disk space - every 1 hour
- Average CPU usage - every 5 minutes
- RAM usage (in megabytes) - every minute

You can enable/disable the checks in `config/config.yml` file

Http server starts and runs on port 9210 after every deploy with Capistrano.

There is an edpoint `/status` that contains the data in JSON format. To check it, just do `curl http://localhost:9210/status`

Data format:
```
{
  "hostname": "<name>",
  "cpu_avg": "<int>%",
  "disk_usage": "<int>%",
  "mem_usage": "<int>",
  "check_time": "<timestamp YYYY-MM-DD HH:SS>"
}
```