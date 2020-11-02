# User Story: Nagios

This user story is about gathering custom Nagios service checks with the [New Relic Nagios On-Host integration](https://docs.newrelic.com/docs/integrations/host-integrations/host-integrations-list/nagios-monitoring-integration). 

Note, in the instructions below, there are references to `[user]` and a `$HOME` path.
The user is your typical user name on your local machine. 
`$HOME` similarly is where your user profile is stored on your machine. On MacOS this is typically `/Users/[user]`, on Linux `/home/[user]` and windows `C:\Users\[user]`

## Pre-requesite

* The tutorial Step-0 is completed

## Deploying

The deploy config file [nagios.json](nagios.json) is provided for this user story. 

To execute the deployment with docker, run the below commands from within your local deployer directory:

* Execute the deployer with the syntax below. This command will take several minutes.
```bash
docker run -it\
    -v $HOME/configs/:/mnt/deployer/configs/\
    --entrypoint ruby deployer main.rb -c configs/[user].docker.local.json -d documentation/tutorial/user_stories/Nagios/nagios.json
```

### Example output from the Demo Deployer

Assuming the following:
* my `[user]` name is `jsmith`
* I've created an AWS .pem key file stored at `$HOME/configs/jsmithUsWest2.pem`
* The AWS credentials secret key path is set in my user config file to `/mnt/deployer/configs/jsmithUsWest2.pem`

Execute the command below to run the deployer with the `nagios.json` deploy config file:
```bash
> docker run -it\
    -v $HOME/configs/:/mnt/deployer/configs/\
    --entrypoint ruby deployer main.rb -c configs/jsmith.docker.local.json -d documentation/tutorial/user_stories/Nagios/nagios.json
[INFO] Executing Deployment
[✔] Parsing and validating Deployment configuration success
[✔] Provisioner success
[✔] Installing On-Host instrumentation success
[INFO] Deployment successful!

Deployed Resources:

  host1 (aws/ec2):
    ip: 18.203.247.73
    instrumentation:
       nr_nagios: newrelic v2.6.0
       nr_infra: newrelic v1.12.1

Installed Services:

Completed at 2020-10-13 08:27:45 +0000

[INFO] This deployment summary can also be found in:
[INFO]   /tmp/jsmith-nagios/deploy_summary.txt
```

After login to New Relic One, you should see a "Nagios-Host1" in Infrastructure.
In New Relic Infrastructure, navigate to Third-party services and click on the Nagios dashboard.

## Teardown

To remove the deployment, re-execute the deployer with the same command syntax and add the parameter `-t` to specify a teardown execution.

For example:
```bash
> docker run -it\
    -v $HOME/configs/:/mnt/deployer/configs/\
    --entrypoint ruby deployer main.rb -c configs/jsmith.docker.local.json -d documentation/tutorial/user_stories/Nagios/nagios.json -t
...
```
