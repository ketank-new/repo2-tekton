# repo2-tekton
sample repo to try and test execution of Task and adding the Task to a Pipeline and further running the pipeline

The branch consist of file below is teh description of usage of each file in sequential order

# Kubernetes playground
1) https://www.katacoda.com/courses/kubernetes/launch-single-node-cluster

2) Install the kubernetes cluster using the following command
   ```
   minikube start --wait=false
   ```
   
3) clone this repo and activate branch 'experiments'

4) run script to install tekton-pipeline and tkn cli tool 
   ```
   cd repo2-tekton
   sh envsetup.sh
   ```
   
5) test tekton pipeline installation and tkn cli tool with the following commands
    ```
    kunectl get namespaces
    tkn --help
    ```
    
6) To apply the configs and rn pipeline and view results

   # Apply Task related configuratiosn to k8s cluster
   kubectl apply -f TaskA.yaml -n tekton-pipelines
   kubectl apply -f TaskB.yaml -n tekton-pipelines
   
   # check if task are created
   tkn tasks list -n tekton-pipelines (must list cloneandrun-1 and cloneandrun-b)

   # Apply Pipeline related configuratiosn to k8s cluster
   kubectl apply -f pipeline.yaml -n tekton-pipelines (You might received errors due to yaml indentations)
   
   # check if pipeline are created
   tkn pipeline list -n tekton-pipelines (must list repo2)
   
   # Run the pipeline
   tkn pipeline start repo2 -n tekton-pipelines
   
   # check the status of pipeline run
   tkn pipelinerun list -n tekton-pipelines
   
   # check the logs 
   tkn pipelinerun logs <name of pipeline run > -n tekton-pipelines
   

   
   



