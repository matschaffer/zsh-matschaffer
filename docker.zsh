export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/mat/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

reset_boot2docker() {
  boot2docker delete
  VBoxManage list hostonlyifs | grep -B3 192.168.59.3 | grep Name: | awk '{print $2}' | xargs -n1 VBoxManage hostonlyif remove
  boot2docker init
  boot2docker up
}
