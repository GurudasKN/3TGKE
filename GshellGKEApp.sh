# Create a Kubernetes cluster
gcloud container clusters create my-cluster --num-nodes=3 --zone=us-central1-a

# Authenticate to the cluster
gcloud container clusters get-credentials my-cluster --zone=us-central1-a

# Deploy an application to the cluster
kubectl create deployment my-app --image=gcr.io/my-project/my-app:v1

# Expose the application to the internet using a LoadBalancer service
kubectl expose deployment my-app --type=LoadBalancer --port=80 --target-port=80
