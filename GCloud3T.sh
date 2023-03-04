# Create a VPC network
gcloud compute networks create my-vpc --subnet-mode=auto

# Create subnets for each tier
gcloud compute networks subnets create my-web-subnet --network=my-vpc --region=us-central1 --range=10.0.1.0/24
gcloud compute networks subnets create my-app-subnet --network=my-vpc --region=us-central1 --range=10.0.2.0/24
gcloud compute networks subnets create my-db-subnet --network=my-vpc --region=us-central1 --range=10.0.3.0/24

# Create firewall rules to allow traffic
gcloud compute firewall-rules create my-allow-http --network=my-vpc --allow tcp:80
gcloud compute firewall-rules create my-allow-https --network=my-vpc --allow tcp:443
gcloud compute firewall-rules create my-allow-ssh --network=my-vpc --allow tcp:22

# Create a load balancer
gcloud compute forwarding-rules create my-lb-forwarding-rule --region=us-central1 --ports=80 --target-pool=my-lb-target-pool
gcloud compute target-pools create my-lb-target-pool --region=us-central1 --health-check=my-lb-health-check
gcloud compute http-health-checks create my-lb-health-check --check-interval=5s --timeout=5s --unhealthy-threshold=2 --healthy-threshold=2 --request-path=/



# Create a Kubernetes cluster
gcloud container clusters create my-cluster --num-nodes=3 --zone=us-central1-a

# Authenticate to the cluster
gcloud container clusters get-credentials my-cluster --zone=us-central1-a

# Deploy an application to the cluster
kubectl create deployment my-app --image=gcr.io/my-project/my-app:v1

# Expose the application to the internet using a LoadBalancer service
kubectl expose deployment my-app --type=LoadBalancer --port=80 --target-port=80


# Create a Cloud SQL instance
gcloud sql instances create my-db-instance --tier=db-n1-standard-1 --region=us-central1

# Create a database
gcloud sql databases create my-db --instance=my-db-instance
