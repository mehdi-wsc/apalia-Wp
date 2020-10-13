# Wordpress on OKD
The repository contains okd templates and docker files to create and install wordpress on openshift cluster
# requirements
- OKD cluster
- No project with name "wordpress" 
# Usage
clone the project:
```
git clone https://github.com/mehdi-wsc/apalia-Wp.git

```
Create New-project: 
```
oc new-project wordpress

``` 
Create secrets:
```
oc create -f secret.yml 
``` 
Create and start build config: 
``` 
oc create -f build-config.yml 
oc start-build docker-build 
``` 
Create and launch template: 
``` 
oc create template -f template.yaml
oc process wordpress-template | oc create -f - 

``` 
To get your Url:
```
oc get routes | awk '{ print $2 }' | tail -1
``` 
# Cleanup environment To clean our work type 
``` 
oc delete project wordpress
```

