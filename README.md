oc new-build --strategy docker --binary  --name myapp

oc start-build myapp --from-dir . --follow

oc new-app myapp
