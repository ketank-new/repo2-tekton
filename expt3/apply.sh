kubectl apply -f secret-git.yaml
kubectl apply -f serviceAccount.yaml
kubectl apply -f resource.yaml
kubectl apply -f resourcetwo.yaml
kubectl apply -f ../expt2-docker-pull/newsecret.yaml
kubectl apply -f Task.yaml
kubectl apply -f run.yaml

alias chk='tkn taskrun ls'
alias pods='kubectl get pods'
