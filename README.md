# Wordpress on OKD
The repository contains okd templates and docker files to create and install wordpress on openshift cluster
# requirements
- OKD cluster
- No project with name "wordpress" 
# Usage
Once you login to your cluster just type :
```
./deploy.sh 

```
and you will have an Wordpress ready to use.

# Cleanup environment 
To clean your work type 
```
oc delete project wordpress
