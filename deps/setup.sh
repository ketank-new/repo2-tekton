kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
curl -LO https://github.com/tektoncd/cli/releases/download/v0.14.0/tkn_0.14.0_Linux_x86_64.tar.gz
sleep 10
sudo tar xvzf tkn_0.14.0_Linux_x86_64.tar.gz -C /usr/local/bin/ tkn
