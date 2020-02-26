Action Script and Instructions for connecting HCP to an external MapR cluster

#Prerequisites
FS Mounted named "mapr" <-- This is not a hard requirement, but you will have to update the action script.  The last 3 lines.

# Update the script before running
In maprtech.repo, set MapR release and MEP version the external cluster is running
```
baseurl=http://package.mapr.com/releases/v6.1.0/redhat/
...
baseurl= http://package.mapr.com/releases/MEP/MEP-6.2.0/redhat
```

Set the cluster name and IP address:
```
/opt/mapr/server/configure.sh -N <cluster name, i.e. bd.demo.cluster> -c -secure -C <IP or FQDN>
```

For a secured cluster, copy the ssl_truststore file to a shared location. In my demo, I copied it to a /share directory because I already had the external MapR cluster FUSE mounted to all EPIC hosts.
```
cp /bd-fs-mnt/mapr/share/ssl_truststore /opt/mapr/conf
```

Launch a cluster, load the action script. Log into the machine and pull a MapR ticket and then you can run a command like "hadoop dfs -ls maprfs://"
