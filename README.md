# checkService

Simple script to check whether a web service is responding to a certain port. Wrote it to monitor PACS servers with a cron job.

to run:
      sudo ./checkService.sh [ip] [port]

e.g. sudo ./checkService.sh 192.168.1.100 443
          
Everything is stored in MySQL database for a owerview. 
