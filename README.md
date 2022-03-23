# Wordpress on ocp
The repository contains okd templates and docker files to create and install wordpress on openshift cluster
# requirements
- OCP cluster
- No project with name "wordpress" 
# Usage
clone the project :
```
git clone https://github.com/mehdi-wsc/apalia-Wp.git

```
Once you login to your cluster just type :
```
./deploy.sh 

```
and you will have an Wordpress ready to use.

# Cleanup environment 
To clean your work type 
```
oc delete project wordpress
