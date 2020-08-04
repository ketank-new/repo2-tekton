# script to install tekton pipeline and tkn cli on k8s cluster

kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
curl -LO https://github.com/tektoncd/cli/releases/download/v0.11.0/tkn_0.11.0_Linux_x86_64.tar.gz
tar xvzf tkn_0.11.0_Linux_x86_64.tar.gz -C /usr/local/bin/ tkn

alias tk-list= 'tkn task list -n tekton-pipelines' # List all task in namespace specified
alias tkr-list= 'tkn taskrun list -n tekton-pipelines' # List all task runs in namespace specified
alias pip-list= 'tkn pipeline list -n tekton-pipelines' # List all pipeline in namespace specified
alias pipr-list= 'tkn pipelinerun list -n tekton-pipelines' # List all pipeline runs in namespace specified