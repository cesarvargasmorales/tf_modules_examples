# Variables global
project_id = "arcane-dynamics-316322"
region     = "us-east1"

# Variables needed to create instance template and group-manager
image_project_id = "centos-cloud"
family           = "centos-7"
instance_name    = "tst-vm-gcp"
instance_type    = "e2-micro"
disk_size_gb     = 30
zone             = "us-east1-b"
instance_size    = "1"
sa_to_gcp        = "tst-sa"
scopes_gcp       = "cloud-platform"
nat_ip           = "34.75.65.134"

# Variables needed to create service account
service_account = "sa-tst-tf"

# Variable needed to create GKE
k8s_name               = "gke-cluster"
k8s_description        = "First GKE"
gcp_region             = "us-east1"
network                = "default"
subnetwork             = "default"
release_channel        = "STABLE"
ip_range_pods          = "127.0.01"
ip_range_services      = "127.0.0.1"
maintenance_start_time = "2020-11-25T15:00:00Z"
maintenance_end_time   = "2020-11-26T11:00:00Z"
recurrence             = "_FRE__Q=WEEKLY;BYDAY=SU"
k8s_sa                 = "sa_gke"
zones                  = "us-east1-b"

# Variables needed to create node pool
node_count   = 3
machine_type = "e2-micro"

# Variables needed to create CloudSQL
db_version      = "db-tst"
db_machine_type = "db-f1-micro"