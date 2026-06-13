.PHONY: run-local run-docker run-minikube clean test

run-local:
    cd app && pip install -r requirements.txt && uvicorn main:app --reload

run-docker:
    docker build -t shitik-fastapi ./app
    docker run -d -p 8000:8000 --name shitik-app shitik-fastapi

run-minikube:
    minikube start --driver=docker
    kubectl apply -f k8s/namespace.yaml
    kubectl apply -f k8s/deployment.yaml
    kubectl apply -f k8s/service.yaml
    minikube service fastapi-svc -n shitik-lab

clean:
    docker stop shitik-app 2>/dev/null || true
    docker rm shitik-app 2>/dev/null || true
    kubectl delete namespace shitik-lab 2>/dev/null || true
    minikube stop

test:
    cd app && pytest test_main.py -v
